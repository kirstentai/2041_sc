#!/bin/sh

rm -f file*.txt 
seq 3 15 | ./speed.pl -n '/5/q' > file1.txt

seq 3 15 | 2041 speed -n '/5/q' > file2.txt

errors=$(diff file1.txt file2.txt)

if [ "$errors" = "" ]
then
	echo "=== Test 09 passed ==="
fi
