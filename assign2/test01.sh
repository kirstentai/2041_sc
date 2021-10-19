#!/bin/sh

rm -f file*.txt 
seq 1 12 | ./speed.pl /2/p > file1.txt

seq 1 12 | 2041 speed /2/p > file2.txt

errors=$(diff file1.txt file2.txt)

if [ "$errors" = "" ]
then
	echo "=== Test 01 passed ==="
fi
