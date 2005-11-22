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

    echo "I: Repo $i"

    stamp=
    for ext in pdf ps; do
        if [ -f "$WEB/$i.$ext" ]; then
            stamp=$(ls -l $WEB/$i.$ext | cut -c38-47)
            break
        fi
    done

    if [ -n "$stamp" ] && [ "$stamp" \< \
       "$(svn info $URL/$i |sed -n '/^Last Changed Date:/{s/^.*: //; s/ .*//; p;}')" \
       ]; then
        echo "I: $i is up to date"
        continue
    fi

    svn export $URL/$i
    if [ -r $i/skript.latex ]; then
        src=$i/skript.latex
    elif [ -r $i/skript.tex ]; then
        src=$i/skript.tex
    else
        echo "E: No latex file found in $i"
        continue
    fi

    cp $WEB/../sty/* $i
    for ext in pdf ps; do
        if rubber --$ext $src && [ -e ${src%.*}.$ext ]; then
            echo "I: installing ${src%.*}.$ext as $i.$ext"
            rm $WEB/$i.$ext
            cp ${src%.*}.$ext $WEB/$i.$ext
        else
            echo "E: building ${src%.*}.$ext failed"
        fi
    done

    rm -r $TMP/*

    echo "I: ...done"
    echo "I:"
done

rmdir $TMP
