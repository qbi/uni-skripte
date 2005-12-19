#!/bin/sh

set -e -u

if [ $# -eq 0 ]; then
    echo "usage: $0 Repository" >&2
    exit 1
fi

REPOS=$1
URL=/home/stud/md01/joergs/.svnroot/$REPOS

if ! [ -d "$URL" ]; then
    echo "$REPOS is not a valid repository in /home/stud/md01/joergs/.svnroot/" >&2
    exit 1
fi
URL=file://$URL
WEB=/home/stud/md01/joergs/.www/skripte/

if [ -e "$WEB/pdf/$REPOS.tar.gz" ] && ( stamp="$(stat -c %y $WEB/pdf/$REPOS.tar.gz)";
     [ "${stamp%% *}" \> "$(svnlook date ${URL#*://} |cut -d\  -f1)" ]); then
    echo "I: $REPOS is up to date"
    exit 0
fi

# exec >$WEB/pdf/$REPOS.build.log 2>&1

export LANG=C

printf "I: "
date

TMP=$(mktemp -d)

cd $TMP

svn export $URL

GZIP=-9 tar -czf $WEB/pdf/$REPOS.tar.gz $REPOS
echo "I: created $REPOS.tar.gz"

if [ -r $REPOS/skript.latex ]; then
    src=skript.latex
elif [ -r $REPOS/skript.tex ]; then
    src=skript.tex
elif [ "$(ls $REPOS/*.latex $REPOS/*.tex 2>/dev/null | wc -l)" -eq 1 ]; then
    src=$(ls $REPOS/*.latex $REPOS/*.tex 2>/dev/null) || true
    src=${src#$REPOS/}
else
    echo "E: No latex file found in $REPOS"
    rm -r $TMP/*
    exit 1
fi
echo "I: using $src as source file"

cp $WEB/sty/* $REPOS
for ext in pdf ps; do
    if rubber --$ext $REPOS/$src && [ -e ${src%.*}.$ext ]; then
        echo "I: installing ${src%.*}.$ext as $REPOS.$ext"
        rm -f $WEB/pdf/$REPOS.$ext
        cp ${src%.*}.$ext $WEB/pdf/$REPOS.$ext
    else
        echo "E: building ${src%.*}.$ext failed"
    fi
done

cd /
rm -r $TMP

echo "I: ...done."
