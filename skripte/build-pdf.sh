#!/bin/sh

set -e -u

URL=file:///home/stud/md01/joergs/.svnroot/
WEB=/home/stud/md01/joergs/.www/skripte/pdf/

exec >$WEB/build.log 2>&1

export LANG=C

printf "I: "
date

TMP=$(mktemp -d)

cd $TMP

for i in carl-ana1 carl-ana2 engelbert-mass-integral erhard-komm-sys \
  fichtner-ewms hecker-parallel linde-stochastik lischke-form-sprachen \
  schmeisser-ana3 schmeisser-hoehere-ana vogel-dml2 vogel-info4; do

    echo "I: Repository $i"

    stamp=
    for ext in pdf ps; do
        if [ -f "$WEB/$i.$ext" ]; then
            stamp="$(stat -c %y $WEB/$i.$ext)"
            stamp="${stamp%% *}"
        fi
    done

    if [ -n "$stamp" ] && [ "$stamp" \> \
         "$(svnlook info ${URL#*://}/$i |sed -n '2{s/ .*//; p;}')" ]; then
        echo "I: $i is up to date"
        continue
    fi

    svn export $URL/$i
    if [ -r $i/skript.latex ]; then
        src=skript.latex
    elif [ -r $i/skript.tex ]; then
        src=skript.tex
    elif [ "$(ls $i/*.latex $i/*.tex 2>/dev/null | wc -l)" -eq 1 ]; then
        src=$(ls $i/*.latex $i/*.tex 2>/dev/null) || true
        src=${src#$i/}
    else
        echo "E: No latex file found in $i"
        rm -r $TMP/*
        continue
    fi
    echo "I: using $src as source file"

    cp $WEB/../sty/* $i
    for ext in pdf ps; do
        if rubber --$ext $i/$src && [ -e ${src%.*}.$ext ]; then
            echo "I: installing ${src%.*}.$ext as $i.$ext"
            rm -f $WEB/$i.$ext
            cp ${src%.*}.$ext $WEB/$i.$ext
        else
            echo "E: building ${src%.*}.$ext failed"
        fi
    done

    rm -r $TMP/*

    echo "I: ...done."
done

rmdir $TMP
