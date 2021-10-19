#!/bin/dash

rm -r -f .girt
echo "=== Start of Test 07 ==="
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
ls .girt/index

echo '$ girt-add b'
./girt-add b

#commit 1
echo '$ girt-commit -a -m "added new file b"'
./girt-commit -a -m "added new file b"

echo '$ echo world >>a'
echo world >>a

#commit 2
echo '$ girt-commit -a -m "changed a"'
./girt-commit -a -m "changed a"

echo '=== Ideal output ===
Committed as commit 2
'
#echo '$ ls .girt/commit-no'
#ls .girt/commit-no
echo '$ ls .girt/commit-no/1'
ls .girt/commit-no/1
echo '=== Ideal output ===
a b
'
echo '$ cat .girt/commit-no/2/a'
cat .girt/commit-no/2/a
#Check logging correctly
echo '
$ girt-log'
./girt-log

echo "=== End of Test 07 ==="



