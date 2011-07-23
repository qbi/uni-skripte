#!/bin/sh

set -u

if [ $# -ne 2 ]; then
    echo "Benutzung: $0 Skript Ziel" >&2
    exit 1
fi

export LANG=C
SKRIPT="$1"
REPOS_PFAD=${REPOS:-/home/jo/svnrepo/uni-skripte}
REPOS_URL=file://$REPOS_PFAD/$SKRIPT
WEB="$2"

printf "I: "
LANG=de_DE.UTF-8 date

TMP=$(mktemp -d)

cd $TMP

svn checkout $REPOS_URL || exit

# erstmal das alte wegräumen, weil wir u. U. kein Schreibrecht auf die
# Datei haben, wenn sie von einem anderen Benutzer angelegt wurde
rm -f $WEB/$SKRIPT.tgz
GZIP=-9 tar --exclude=.svn -czf $WEB/$SKRIPT.tgz $SKRIPT
echo "I: $SKRIPT.tgz erzeugt"

cd $SKRIPT
if [ -r skript.latex ]; then
    src=skript.latex
elif [ -r skript.ltx ]; then
    src=skript.ltx
elif [ -r skript.tex ]; then
    src=skript.tex
elif [ "$(ls *.latex *.tex *.ltx 2>/dev/null | wc -l)" -eq 1 ]; then
    src=$(ls *.latex *.tex *.ltx 2>/dev/null) || true
else
    echo "F: Keine LaTeX-Datei im $SKRIPT gefunden"
    cd /
    rm -r $TMP
    exit 1
fi
echo "I: Verwende $src als LaTeX-Datei"

if grep -q '\\documentclass *\[[^]]*draft' $src; then
    sed -i.orig -e '/\\documentclass/ { s/draft,//; s/,draft\]//; }' $src
fi

for ext in ps pdf; do
    # Das Skript verwendet PSTricks. rubber muss aus dem PS das PDF erstellen.
    if grep -Eq '^[^%]*\\usepackage.*{pst(-|ricks})' $src; then
        opt=--ps
    else
        opt=
    fi

    if rubber --quiet $opt --$ext --inplace $src && [ -e ${src%.*}.$ext ]; then
        echo "I: Kopiere ${src%.*}.$ext nach $SKRIPT.$ext"
        rm -f $WEB/$SKRIPT.$ext
        cp ${src%.*}.$ext $WEB/$SKRIPT.$ext
    else
        echo "F: Übersetzung von ${src%.*}.$ext fehlgeschlagen; ($$)"
        rubber-info --errors $src
        rubber --clean --$ext $src
        (
            which rubber latex pdflatex
            env
            rubber -vvvv --$ext --inplace $src
        ) > /tmp/joergs.debug.$$ 2>&1
    fi
done

if [ -e $src.orig ]; then
    rm $src
    mv $src.orig $src
fi

rm -f $WEB/$SKRIPT-mit-grafiken.tgz
GZIP=-9 tar --exclude=.svn -C .. -czf $WEB/$SKRIPT-mit-grafiken.tgz $SKRIPT
echo "I: $SKRIPT-mit-grafiken.tgz erzeugt"

##########
#
# Qualitätsprüfung
#

echo "I: Zusammenfassung: $(rubber-info --errors $src | wc -l) Fehler,\
 $(rubber-info --warnings $src | wc -l) Warnungen,\
 $(rubber-info --boxes $src | wc -l) Boxen,\
 $(rubber-info --refs $src | wc -l) Referenzen"

( rubber-info --warnings $src | grep -E '(nag|onlyamsmath)';
  rubber-info --refs $src) | sed 's/^/W: /'

svnlook cat "$REPOS_PFAD" werkzeuge/skript-check > $TMP/sc
chmod +x $TMP/sc

dateien=$(find . -type f -name .svn -prune -o \( -name \*tex -o -name \*.ltx \) \
                    -a -not -path "./$src")
echo I: skript-check $src $dateien
$TMP/sc $src $dateien

for i in $src $dateien
do
    grep -q "$(printf '\r')\$" $i && \
      echo "F: Die Zeilenenden in $i nur mit Newline nicht mit Carriage" \
        "return kennzeichen. Eventuell das SVN-Schlüsselwort svn:eol-style" \
        "auf LF setzen."
done

if [ -e ${src%.*}.idx ] && ! [ -e ${src%.*}.idx ]; then
    echo "W: die Indexdatei ${src%.*}.idx existiert, ist aber leer."
fi

if [ -e missfont.log ]; then
    echo "F: TeX hat die Datei missfont.log erstellt"
    cat missfont.log
fi

rubber --clean --pdf --inplace $src
rubber --clean --ps --inplace $src

svn status | while read aktion datei; do
    case "$aktion" in
      ?) echo "F: rubber hat die Datei $datei nicht weggeräumt";;
      !) echo "F: rubber hat die Datei $datei gelöscht";;
      *) echo "F: Die Datei $datei wurde verändert ($aktion)";;
    esac
done

keywords=$(svn propget svn:keywords $src)
for i in LastChangedRevision LastChangedDate; do
    case "$keywords" in
      *"$i"*) ;;
      *) echo "F: das SVN-Schlüsselwort \"$i\" ist nicht gesetzt";;
    esac
done

# Wir sollten immer zu den Dateien die Quellen im SVN ablegen und rubber
# daraus dann die Bilder bauen lassen
dateien=$(find . -type f -name .svn -prune -o -name \*.ps -o -name \*.eps \
  -o -name \*.pdf)
if [ -n "$dateien" ]; then
    echo "W: Dateien in unüblichen Quellformat" $dateien
fi

# Wir sollten darauf achten, dass wir nur Vektorformate für die Grafiken
# verwenden
dateien=$(find . -type f -name .svn -prune -o -name \*.jpg -o -name \*.png)
if [ -n "$dateien" ]; then
    echo "W: Dateien nicht im Vektorformat" $dateien
fi

##########
#
# Hilferufe extrahieren
#
dateien=$(find . -type f -name .svn -prune -o -name \*tex -o -name \*.ltx)
sed -n '/\\help{/ { =; s/.*\\help{//; :mark /}/!{ N; s/\n/ /; b mark; }; s/}.*//; p;}' \
  $dateien | sed 's/^/H: (/; s/$/) /; N; s/\n//;'

cd /
rm -fr $TMP

echo "I: fertig."
