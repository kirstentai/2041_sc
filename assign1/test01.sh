#!/bin/dash

rm -r -f .girt
echo "=== Start of Test 01 ==="
#Initialise necessary files
./girt-init
echo '$ touch a b c d e'
touch a b c d e

#commit before adding
echo '$ girt-commit -m "commit before adding"'
echo '=== Actual output ==='
./girt-commit -m "commit before adding"
echo '=== Ideal output ===
ls: cannot access .girt/index: No such file or directory
nothing to commit
'

echo '$ girt-add a b'
./girt-add a b

#1st commit - fail
echo "$ girt-commit -m "
echo '=== Actual output ==='
./girt-commit -m
echo '=== Ideal output ===
girt-commit: error: no message
'
#Add files
echo '$ echo hello >a'
echo hello >a

#1st commit - pass
echo '$ girt-commit -m "a ver1"'
echo '=== Actual output ==='
./girt-commit -m "a ver1"
echo '=== Ideal output ===
Committed as commit 0
'
#Check commits
echo '$ ls .girt/commit-no/0'
echo '=== Actual output ==='
ls .girt/commit-no/0
echo '=== Ideal output ===
a   b
'

#Add files and 2nd commit - edited file, no add - fail
echo '$ echo world >a'
echo world >a
echo '$ girt-commit -m "a ver2"'
echo '=== Actual output ==='
./girt-commit -m "a ver2"
echo '=== Ideal output ===
nothing to commit
'

#Add files
echo '$ girt-add a b'
./girt-add a b

#Check existing commits
echo '$ ls .girt/index'
echo '=== Actual output ==='
ls .girt/index
echo '=== Ideal output ===
a   b
'
#Check content in index
echo '$ cat .girt/index/a'
echo '=== Actual output ==='
cat .girt/index/a
echo '=== Ideal output ===
world
'

#Check commits
echo '$ ls .girt.commit-no/1'
echo '=== Actual output ==='
ls .girt/commit-no/1
echo '=== Ideal output ===
ls: cannot access .girt/commit-no/1: No such file or directory
'

echo "=== End of Test 01 ==="




