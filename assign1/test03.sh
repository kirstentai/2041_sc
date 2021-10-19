#!/bin/dash

rm -r -f .girt
echo "=== Start of Test 03 ==="
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

#test girt-show - pass
echo '$ girt-show 0:a'
echo '=== Actual output ==='
./girt-show 0:a
echo "=== Ideal output ===
hello
"
echo '$ echo world >>a'
echo world >>a

#test girt-show - fail - no commit
echo '$ girt-show 1:a'
echo '=== Actual output ==='
./girt-show 1:a
echo "=== Ideal output ===
girt-show: error: unknown commit '1'
"
#add changes
echo '$ girt-add a'
./girt-add a

#Commit new a edit
echo '$ girt-commit -m "new changes in a"'
./girt-commit -m "new changes in a"

#test girt-show - pass
echo '$ girt-show 1:a'
echo '=== Actual output ==='
./girt-show 1:a
echo "=== Ideal output ===
hello
world
"
#Check logging correctly
echo '$ girt-log'
./girt-log

echo "=== End of Test 03 ==="




