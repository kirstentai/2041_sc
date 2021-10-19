#!/bin/dash

rm -r -f .girt
echo "=== Start of Test 05 ==="
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
echo '$ girt-commit -m "a b ver1"'
echo '=== Actual output ==='
./girt-commit -m "a b ver1"
echo '=== Ideal output ===
Committed as commit 0
'
echo '$ echo world >>a'
echo world >>a

echo '$ ls .girt/index'
echo '=== Actual output ==='
ls .girt/index
echo '=== Ideal output ===
a b
'
echo '$ girt-commit -a -m "changes in a"'
echo '=== Actual output ==='
./girt-commit -a -m "changes in a"
echo '=== Ideal output ===
Committed as commit 1
'
echo '$ echo hello >c'
echo hello >c
echo '$ girt-commit -a -m "new c file created"'
echo '=== Actual output ==='
./girt-commit -a -m "new c file created"
echo '=== Ideal output ===
Nothing to commit
'
echo '$ ls .girt/index'
ls .girt/index
echo '=== Ideal output ===
a b
'
echo '$ ls .girt/commit-no/2'
ls .girt/index/commit-no/2
echo '=== Ideal output ===
[error]
'
#Check logging correctly
echo '$ girt-log'
./girt-log

echo "=== End of Test 05 ==="



