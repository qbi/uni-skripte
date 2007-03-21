#!/bin/sh

set -u

: ${REPO:=/home/stud/md01/joergs/.svnroot/skripte}
: ${WEB:=/home/stud/md01/joergs/.www/skripte}
give_away=/home/stud/md01/joergs/give_away
PATH="/mnt/local/joergs/texlive/bin/i386-linux:/home/stud/md01/joergs/xindy/bin:$PATH"

tmp=$(mktemp)

if ! svnlook cat "$REPO" werkzeuge/erzeuge-ausgabe.sh > $tmp; then
    echo "konnte \"erzeuge-ausgabe.sh\" nicht finden"
    rm $tmp
    exit 1
fi

cd /
for skript in $(svnlook tree "$REPO" |
                grep '^ [[:alnum:]]\+-[-[:alnum:]]\+/$'); do
    skript=${skript%/}
    echo -n "übersetze $skript..."

    log=$WEB/"$skript".Build.log
    rm --force "$log"
    nice -n 4 env -i PATH="$PATH" sh $tmp "$skript" "$WEB" > "$log" 2>&1
    $give_away "$log" $WEB/"$skript".pdf $WEB/"$skript".ps $WEB/"$skript".tar.gz

    echo fertig
done

rm $tmp
