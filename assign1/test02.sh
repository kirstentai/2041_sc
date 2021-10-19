#!/bin/dash

rm -r -f .girt
echo "=== Start of Test 02 ==="
#Initialise necessary files
./girt-init

#Add files
echo '$ echo hello >a'
echo hello >a
echo '$ echo hello >b'
echo hello >b
echo '$ girt-add a'
./girt-add a
echo '$ girt-add b'
./girt-add b

#Commit a and b
echo '$ girt-commit -m "a b ver1"'
./girt-commit -m "a b ver1"

#test girt-show - fail - wrong format
echo '$ girt-show :c'
echo '=== Actual output ==='
./girt-show :c
echo "=== Ideal output ===
girt-show: error: 'c' not found in index
"

#test girt-show - fail - invalid
echo '$ girt-show 0:c'
echo '=== Actual output ==='
./girt-show 0:c
echo "=== Ideal output ===
girt-show: error: 'c' not found in commit 0
"

#test girt-show - pass
echo '$ girt-show 0:a'
echo '=== Actual output ==='
./girt-show 0:a
echo "=== Ideal output ===
[success output]
"

#Check logging correctly
echo '$ girt-log'
./girt-log

echo "=== End of Test 02 ==="




