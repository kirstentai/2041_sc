#!/bin/sh

rm -f file*.txt 
seq 1 10 | ./speed.pl /a/q > file1.txt

seq 1 10 | 2041 speed /a/q > file2.txt

errors=$(diff file1.txt file2.txt)

if [ "$errors" = "" ]
then
	echo "=== Test 03 passed ==="
fi
