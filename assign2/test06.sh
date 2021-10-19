#!/bin/sh

rm -f file*.txt 
seq 10 20 | ./speed.pl 's/[1]/zzz/' > file1.txt

seq 10 20 | 2041 speed 's/[1]/zzz/' > file2.txt

errors=$(diff file1.txt file2.txt)

if [ "$errors" = "" ]
then
	echo "=== Test 06 passed ==="
fi
