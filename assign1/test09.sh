#!/bin/dash

rm -r -f .girt
echo "=== Start of Test 09 ==="
#Initialise necessary files
./girt-init

#Add files
echo '$ echo hello >a'
echo hello >a
echo '$ echo hello >b'
echo hello >b
echo '$ girt-add a b'
./girt-add a b

#Commit a and b
echo '$ girt-commit -m "a ver1"'
./girt-commit -m "a ver1"

echo '$ ls .girt/index'
ls .girt/index
echo '$ rm b'
rm b

echo '$ ls .girt/index'
ls .girt/index

echo '$ echo world >>a'
echo world >>a

#commit 1
echo '$ girt-commit -a -m "removed b, edited a"'
echo '=== Actual output ==='
./girt-commit -a -m "removed b, edited a"
echo '=== Ideal output ===
Committed to commit 1
'

echo '$ girt-show 0:a'
echo '=== Actual output ==='
./girt-show 0:a
echo '=== Ideal output ===
hello
'

echo '$ girt-show 0:b'
echo '=== Actual output ==='
./girt-show 0:b
echo '=== Ideal output ===
hello
'
echo '$ girt-show 1:b'
echo '=== Actual output ==='
./girt-show 1:b
echo '=== Ideal output ===
[error]
'
echo '$ girt-log'
./girt-log

echo "=== End of Test 09 ==="



