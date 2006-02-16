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

export PATH=$joergs/rubber-1.0/bin:$joergs/xindy/bin: \
  /mnt/local/joergs/texlive/bin/i386-linux/:$PATH

REPOS=$1
URL=$joergs/.svnroot/$REPOS

if ! [ -d "$URL" ]; then
    echo "$REPOS is not a valid repository in /home/stud/md01/joergs/.svnroot/" >&2
    exit 1
fi
URL=file://$URL
WEB=$joergs/.www/skripte/

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

#cp $WEB/sty/* .
for ext in pdf ps; do
    if rubber --$ext --inplace $src && [ -e ${src%.*}.$ext ]; then
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
