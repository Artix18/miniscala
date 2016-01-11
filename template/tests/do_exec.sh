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
    if grep -q "<" out; then
        echo "Failed: The compilation should have succeded";
    else
        score=`expr $score + 1`
    fi
done
echo

rm -f out

echo
percent=`expr 100 \* $score / $max`;
echo "Score: $score / $max tests, soit $percent%"
