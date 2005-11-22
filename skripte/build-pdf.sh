#!/bin/sh

set -e -u

URL=file:///home/stud/md01/joergs/.svnroot/
WEB=/home/stud/md01/joergs/.www/skripte/pdf/

exec >$WEB/build.log 2>&1

export LANG=C

TMP=$(mktemp -d)

cd $TMP

for i in carl-ana1 carl-ana2 engelbert-mass-integral erhard-komm-sys \
  fichtner-ewms hecker-parallel linde-stochastik lischke-form-sprachen \
  schmeisser-ana3 schmeisser-hoehere-ana vogel-dml2 vogel-info4; do

    echo "***Repo: $i"

    stamp=
    for ext in pdf ps; do
        if [ -f "$WEB/$i.$ext" ]; then
            stamp=$(ls -l $WEB/$i.$ext | cut -c38-47)
            break
        fi
    done

    if [ -n "$stamp" ] && [ "$stamp" -lt \
       "$(svn info $URL/$i |sed -n '/^Last Changed Date:/{s/^.*: //; s/ .*//; p;}')" \
       ]; then
        echo "$i is up to date"
        continue
    fi

    svn export $URL/$i
    if [ -r $i/skript.latex ]; then
        src=$i/skript.latex
    elif [ -r $i/skript.tex ]; then
        src=$i/skript.tex
    else
        echo "No latex file found in $i" >&2
        continue
    fi

    cp $WEB/../sty/* $i
    for ext in pdf ps; do
        if rubber --$ext $src && [ -e ${src%.*}.$ext ]; then
            rm $WEB/$i.$ext
            cp skript.pdf $WEB/$i.$ext
        fi
    done

    rm -r $TMP/*

    echo "...done"
done

rmdir $TMP
