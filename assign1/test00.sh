#!/bin/dash

rm -r -f .girt
echo "=== Start of Test 00 ==="
echo '$ girt-init'
echo '=== Actual output ==='
./girt-init
echo "=== Ideal output ===
Initialized empty girt repository in .girt
"
echo '$ girt-init'
echo '=== Actual output ==='
./girt-init
echo "=== Ideal output ===
girt-init: error: .girt already exists
"

echo '$ touch a b c d e'
touch a b c d e
echo '$ girt-add a b c'
./girt-add a b c
echo "$ girt-commit -m \"message 1\" "
./girt-commit -m "ver 1"


echo '$ echo hello >a'
echo hello >a
echo '$ echo hello >b'
echo hello >b
echo '$ echo hello >c'
echo hello >c

echo '$girt-add a b'
./girt-add a b

echo '$ls .girt/index'
ls .girt/index
echo 'Expected a b c'

echo "=== End of test 00 ==="




