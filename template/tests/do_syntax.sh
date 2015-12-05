#!/bin/bash

score=0
max=0

echo "syntax/good"

for f in syntax/good/*.scala; do
    max=`expr $max + 1`;
    echo $f
    rm -f out
    ../pscala $f > out 2>&1;
    if grep -q "File" out; then
        echo "Failed: The compilation should have succeded";
    else if grep -q "Anomaly" out; then
        echo "Failed: Anomaly";
    else
        score=`expr $score + 1`
    fi
    fi
done
echo

echo "syntax/bad/"

for f in syntax/bad/*.scala; do
    max=`expr $max + 1`;
    echo $f
    rm -f out
    ../pscala $f > out 2>&1;
    if grep -q "File" out; then
    	score=`expr $score + 1`;
    else if grep -q "Anomaly" out; then
	    echo "Failed: Anomaly";
    else
	    echo "Failed: The compilation should have resulted in an error."   
    fi
    fi
done

rm -f out

echo
percent=`expr 100 \* $score / $max`;
echo "Score: $score / $max tests, soit $percent%"
