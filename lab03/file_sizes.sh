#!/bin/sh

for file in `ls`
do
	count=$((`wc -l $file | cut -d' ' -f1`))
	if (($count < 10))
	then
		small_files+=' '$file
	elif (($count < 100))
	then
		med_files+=' '$file
	else
		large_files+=' '$file
	fi
done

echo Small files: $small_files
echo Medium-sized files: $med_files
echo Large files: $large_files
