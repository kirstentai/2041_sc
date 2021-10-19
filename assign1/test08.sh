#!/bin/dash

rm -r -f .girt
echo "=== Start of Test 08 ==="
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

#commit 1
echo '$ girt-commit -a -m "added new file b"'
echo '=== Actual output ==='
./girt-commit -a -m "added new file b"
echo '=== Ideal output ===
nothing to commit
'

echo '$ ls .girt/index'
echo '=== Actual output ==='
ls .girt/index
echo '=== Ideal output ===
a
'
echo '$ girt-log'
./girt-log

echo "=== End of Test 08 ==="



