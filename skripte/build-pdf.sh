#!/bin/sh

set -e -u

URL=file:///home/stud/md01/joergs/.svnroot/
WEB=/home/stud/md01/joergs/.www/skripte/pdf/

exec 2>$WEB/build.log

export LANG=C

TODAY=$(date --iso-8601)

TMP=$(mktemp -d)

cd $TMP

for i in carl-ana1 carl-ana2 engelbert-mass-integral erhard-komm-sys \
  fichtner-ewms hecker-parallel linde-stochastik lischke-form-sprachen \
  schmeisser-ana3 schmeisser-hoehere-ana vogel-dml2 vogel-info4; do

    if [ -f "$WEB/$i.pdf" ]; then file="$WEB/$i.pdf"
    elif [ -f "$WEB/$i.ps" ]; then file="$WEB/$i.ps"
    else continue
    fi

    if [ "$(svn info $URL/$i |sed -n '/^Last Changed Date:/{s/^.*: //; s/ .*//; p;}')" \
      -le "$(ls -l $file | cut -c38-47)" ]; then
        continue
    fi

    svn export $URL/$i .
    cp $WEB/../sty/* .
    if rubber --pdf skript.latex && [ -e skript.pdf ]; then
        rm $WEB/$i.pdf
        cp skript.pdf $WEB/$i.pdf
    fi
    if rubber --ps skript.latex && [ -e skript.ps ]; then
        rm $WEB/$i.ps
        cp skript.pdf $WEB/$i.ps
    fi
    rm -r *
done

rmdir $TMP
