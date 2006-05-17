#!/bin/sh

set -u

if [ $# -eq 0 ]; then
    echo "usage: $0 Repository" >&2
    exit 1
fi

if [ $(hostname) != "ppc214" ]; then
    echo "You must run this script on ppc214 to get access to TexLive"
    exit 1
fi

joergs=/home/stud/md01/joergs

export LANG=C
REPOS=$1
URL=$joergs/.svnroot/$REPOS
WEB=$joergs/.www/skripte/

if ! [ -d "$URL" ]; then
    echo "$REPOS is not a valid repository in /home/stud/md01/joergs/.svnroot/" >&2
    exit 1
fi
URL=file://$URL

if [ -e "$WEB/pdf/$REPOS.tar.gz" ] && ( stamp="$(stat -c %y $WEB/pdf/$REPOS.tar.gz)";
     [ "${stamp%% *}" \> "$(svnlook date ${URL#*://} |cut -d\  -f1)" ]); then
    echo "I: $REPOS is up to date"
    exit 0
fi

printf "I: "
date

TMP=$(mktemp -d)

cd $TMP

svn export $URL || exit

GZIP=-9 tar -czf $WEB/pdf/$REPOS.tar.gz $REPOS
echo "I: created $REPOS.tar.gz"

cd $REPOS
if [ -r skript.latex ]; then
    src=skript.latex
elif [ -r skript.tex ]; then
    src=skript.tex
elif [ "$(ls *.latex *.tex 2>/dev/null | wc -l)" -eq 1 ]; then
    src=$(ls *.latex *.tex 2>/dev/null) || true
else
    echo "E: No latex file found in $REPOS"
    cd /
    rm -r $TMP
    exit 1
fi
echo "I: using $src as source file"

# Aus irgendeinem Grund braucht das pdflatex aus TeXLive die HOME-Variable um
# dort ein Unterverzeichnis .texlive2005 mit irgendwelchen Konfigurationen
# anzulegen.
export HOME=$TMP

for ext in pdf ps; do
    if rubber --$ext --inplace $src && [ -e ${src%.*}.$ext ]; then
        echo "I: installing ${src%.*}.$ext as $REPOS.$ext"
        rm -f $WEB/pdf/$REPOS.$ext
        cp ${src%.*}.$ext $WEB/pdf/$REPOS.$ext
    else
        echo "E: building ${src%.*}.$ext failed; cleanup and rerun with -vvvv"
        rubber --clean --$ext $src
        rubber -vvvv --$ext --inplace $src
        env
        which rubber latex pdflatex
    fi
done

echo "I: check for bad latex..."
$joergs/TeXidate.pl $src

# Todo: eigene Überprüfungen machen
#   + keine \newcommand oder \renewcommand nach \begin{document}
#   + z.(| |~|\ )B. und d. h. müssen als z.\,B. geschrieben sein
#   + Komma vor etc.

cd /
rm -r $TMP

echo "I: ...done."
