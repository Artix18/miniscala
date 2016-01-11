#!/bin/bash

score=0
max=0

echo "exec/"

for f in exec/*.scala; do
    max=`expr $max + 1`;
    echo "* ""$f"
    rm -f out
    ../pscala $f && gcc ./lol.s;
    ./a.out > out;
    if [ $? -eq 0 ]
    then
        filename="${f%.*}";
        fout="$filename"".out";
        rm -f truc;
        diff out $fout > truc;
        if grep -q '<' truc
        then
            echo 'Failed: Wrong output, you did shit !'
        else
            echo 'Success ! <3'
            score=`expr $score + 1`
        fi
    else
        echo 'Failed: Unexpected runtime error'
    fi
done
echo

rm -f out

echo
percent=`expr 100 \* $score / $max`;
echo "Score: $score / $max tests, soit $percent%"
