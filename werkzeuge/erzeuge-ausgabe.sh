#!/bin/sh

set -u

if [ $# -ne 2 ]; then
    echo "Benutzung: $0 Skript Ziel" >&2
    exit 1
fi

if [ $(hostname) != "ppc214" ]; then
    echo "Das Programm muss auf ppc214 aufgerufen werden," \
      "damit TexLive verfügbar ist"
    exit 1
fi

joergs=/home/stud/md01/joergs

export LANG=C
SKRIPT="$1"
SKRIPTE_PFAD=$joergs/.svnroot/skripte
URL=file://$SKRIPTE_PFAD/$SKRIPT
WEB="$2"

printf "I: "
LANG=de_DE.UTF-8 date

TMP=$(mktemp -d)

cd $TMP

svn export $URL || exit

# erstmal das alte wegräumen, weil wir u. U. kein Schreibrecht auf die
# Datei haben, wenn sie von einem anderen Benutzer angelegt wurde
rm -f $WEB/$SKRIPT.tar.gz
GZIP=-9 tar -czf $WEB/$SKRIPT.tar.gz $SKRIPT
echo "I: $SKRIPT.tar.gz erzeugt"

cd $SKRIPT
if [ -r skript.latex ]; then
    src=skript.latex
elif [ -r skript.tex ]; then
    src=skript.tex
elif [ "$(ls *.latex *.tex 2>/dev/null | wc -l)" -eq 1 ]; then
    src=$(ls *.latex *.tex 2>/dev/null) || true
else
    echo "F: Keine LaTeX-Datei im $SKRIPT gefunden"
    cd /
    rm -r $TMP
    exit 1
fi
echo "I: Verwende $src als LaTeX-Datei"

# Aus irgendeinem Grund braucht das pdflatex aus TeXLive die HOME-Variable um
# dort ein Unterverzeichnis .texlive2005 mit irgendwelchen Konfigurationen
# anzulegen.
export HOME=$TMP

for ext in pdf ps; do
    if rubber --quiet --$ext --inplace $src && [ -e ${src%.*}.$ext ]; then
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

echo "I: Zusammenfassung: $(rubber-info --errors $src | wc -l) Fehler,\
 $(rubber-info --boxes $src | wc -l) übervolle Boxen,\
 $(rubber-info --warnings $src | wc -l) Warnungen,\
 $(rubber-info --refs $src | wc -l) fehlerhafte Referenzen"

vorlver=$(svnlook history $SKRIPTE_PFAD vorlage/skript.latex |
  sed -e 1,2d -e 's@[[:space:]]*@@g; s@/.*@@; q')
if ! grep --quiet --ignore-case --line-regexp \
  "[[:space:]]*%[[:space:]]*entspricht[[:space:]]*vorlage:[[:space:]]*$vorlver" $src; then
    echo "F: Das Skript ist nicht mehr auf dem aktuellen Stand der Vorlage"
fi

echo "I: Prüfe auf schlechten LaTeX-Stil und überprüfe Microtypographie..."
rubber-info --warnings $src | grep -E '(nag|onlyamsmath)'

# * keine \newcommand oder \renewcommand nach \begin{document}
#   Alle Definitionen sollen in der Präampel stehen, sonst wird es
#   unübersichtlich
# * z.(| |~|\ )B. und d. h. müssen als z.\,B. geschrieben sein
#   http://www.dante.de/dante/DTK/dtk96_4/Text/dtk96_4_neubauer_feinheiten.pdf
# * kein Komma vor etc.
perl -wn -e 'BEGIN {$in_doc = 0; }' \
  -e 's/%.*// if (/(^|[^\\])%/);' \
  -e '$in_doc = 1 if ($_ =~ /^[^%]*\\begin{document}/);' \
  -e 'print "$.\t$_" if ($_ =~ /\\(re)?newcommand/ and $in_doc);' \
  -e 'print "$.\t$_" if ($_ =~ /[[:alpha:]]\.([^[:alpha:][:digit:]{}]*)[[:alpha:]]\./
                         and $1 ne "\\,");' \
  -e 'print "$.\t$_" if ($_ =~ /,[[:space:]]etc/);' *tex

cd /
rm -r $TMP

echo "I: ... fertig."
