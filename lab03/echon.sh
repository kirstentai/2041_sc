#!/bin/sh

if test $# -ne 2
then
	echo "Usage: ./echon.sh <number of lines> <string>"
	exit 1
fi

echo $1 | egrep '^\+?[0-9]+$' > /dev/null

if test $? -ne 0 || $1 -lt 0
then
	echo "./echon.sh: argument 1 must be a non-negative integer"
	exit 1
fi

n=$1
word=$2

i=0
while test "$i" -lt  "$n"
do
	echo "$word"
	i=$((i+1))
done
