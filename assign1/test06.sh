#!/bin/dash

rm -r -f .girt
echo "=== Start of Test 06 ==="
#Initialise necessary files
./girt-init

#Add files
echo '$ echo hello >a'
echo hello >a
echo '$ echo hello >b'
echo hello >b
echo '$ girt-add a'
./girt-add a

#Commit a and b
echo '$ girt-commit -m "a ver1"'
echo '=== Actual output ==='
./girt-commit -m "a ver1"
echo '=== Ideal output ===
Committed as commit 0
'
echo '$ ls .girt/index'
echo '=== Actual output ==='
ls .girt/index
echo '=== Ideal output ===
a
'
echo '$ girt-add b'
./girt-add b
echo '$ girt-commit -a -m "added new file b"'
echo '=== Actual output ==='
./girt-commit -a -m "added new file b"
echo '=== Ideal output ===
Committed as commit 1
'
echo '$ ls .girt/index'
ls .girt/index
echo '=== Ideal output ===
a b
'
echo '$ ls .girt/commit-no'
ls .girt/commit-no
echo '$ ls .girt/commit-no/1'
ls .girt/commit-no/1
echo '=== Ideal output ===
a b
'
#Check logging correctly
echo '$ girt-log'
./girt-log

echo "=== End of Test 06 ==="



