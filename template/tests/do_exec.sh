#!/bin/bash

score=0
max=0

echo "exec/"

for f in exec/*.scala; do
    max=`expr $max + 1`;
    echo $f
    rm -f out
    ../pscala $f && gcc ./lol.s;
    ./a.out > out;
    filename="${f%.*}";
    fout="$filename"".out";
    rm -f truc;
    `diff out $fout` > truc;
    if grep -q '<' truc; then
        echo "Failed: The compilation should have succeded";
    else
        echo "Succès !";
        score=`expr $score + 1`
    fi
done
echo

rm -f out

echo
percent=`expr 100 \* $score / $max`;
echo "Score: $score / $max tests, soit $percent%"
