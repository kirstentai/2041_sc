#!/bin/sh

rm -f file*.txt 
seq 1 10 | ./speed.pl 4d > file1.txt

seq 1 10 | 2041 speed 4d > file2.txt

errors=$(diff file1.txt file2.txt)

if [ "$errors" = "" ]
then
	echo "=== Test 04 passed ==="
fi
