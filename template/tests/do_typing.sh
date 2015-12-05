#!/bin/bash

score=0
max=0

echo "typing/good"

for f in typing/good/*.scala exec/*.scala exec-fail/*.scala; do
    max=`expr $max + 1`;
    echo $f
    rm -f out
    ../pscala $f > out 2>&1;
    if grep -q "Typage reussi." out; then
        score=`expr $score + 1`;
    else if grep -q "Anomaly" out; then
        echo "Failed: Anomaly";
    else
        echo "Failed: The compilation should have succeded"
    fi
    fi
done
echo

echo "typing/bad/"

for f in typing/bad/*.scala; do
    max=`expr $max + 1`;
    echo $f
    rm -f out
    ../pscala $f > out 2>&1;
    if grep -q "Typage reussi" out; then
    	echo "Failed: The compilation should have resulted in an error."   
    #else if grep -q "Anomaly" out; then
	#    echo "Failed: Anomaly";
    else
        score=`expr $score + 1`
    #fi
    fi
done

rm -f out

echo
percent=`expr 100 \* $score / $max`;
echo "Score: $score / $max tests, soit $percent%"
