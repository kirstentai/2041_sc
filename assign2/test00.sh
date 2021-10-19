#!/bin/sh

rm -f file*.txt 
seq 1 5 | ./speed.pl 2p > file1.txt

#echo "actual\n";
seq 1 5 | 2041 speed 2p > file2.txt

errors=$(diff file1.txt file2.txt)

if [ "$errors" = "" ]
then
	echo "=== Test 00 passed ==="
fi
