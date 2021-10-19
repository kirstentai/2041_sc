#!/bin/sh

rm -f file*.txt 
seq 10 19 | ./speed.pl -n '5s/[1]/zzz/' > file1.txt

seq 10 19 | 2041 speed -n '5s/[1]/zzz/' > file2.txt

errors=$(diff file1.txt file2.txt)

if [ "$errors" = "" ]
then
	echo "=== Test 08 passed ==="
fi
