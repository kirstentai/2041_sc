#!/bin/dash

rm -r -f .girt
echo "=== Start of Test 04 ==="
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

#test girt-show - pass
echo '$ girt-show 0:a'
./girt-show 0:a
echo '$ girt-show 0:b'
./girt-show 0:b

echo '$ echo world >>a'
echo world >>a

echo '$ echo world >>b'
echo world >>b

echo '$ girt-commit -a -m "changes in a"'
echo '=== Actual output ==='
./girt-commit -a -m "changes in a"
echo '=== Ideal output ===
Committed as commit 1
'
echo '$ cd .girt/commit-no/1'
ls .girt/commit-no/1
echo '$ cat a'
cat a
#echo '$ cat .girt/commit-no/1/a'
#cat .girt/commit-no/1/a

#test girt-show - pass
echo '$ girt-show 1:a'
echo '=== Actual output ==='
./girt-show 1:a
echo "=== Ideal output ===
hello
world
"
echo '$ echo girt-show 1:b'
./girt-show 1:b

echo '$ echo girt-show :b'
./girt-show :b
#Check logging correctly
echo '$ girt-log'
./girt-log

echo "=== End of Test 04 ==="




