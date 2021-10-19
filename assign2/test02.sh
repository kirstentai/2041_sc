#!/bin/sh

rm -f file*.txt 
seq 1 12 | ./speed.pl /a/p > file1.txt

seq 1 12 | 2041 speed /a/p > file2.txt

errors=$(diff file1.txt file2.txt)

if [ "$errors" = "" ]
then
	echo "=== Test 02 passed ==="
fi
