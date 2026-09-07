#!/bin/bash

echo "===================================="
echo " Linux TAIL Command - Auto Grading"
echo "===================================="

# Run student solution
bash starter/solution.sh > output.txt 2>&1


# ------------------------------------
# TEST CASE 1: File Creation
# ------------------------------------

if [ -f state.txt ]
then
    echo "PASS: Test Case 1 - File creation"
else
    echo "FAIL: Test Case 1 - File was not created"
    exit 1
fi


# ------------------------------------
# TEST CASE 2: File has 10 lines
# ------------------------------------

line_count=$(wc -l < state.txt)

if [ "$line_count" -eq 10 ]
then
    echo "PASS: Test Case 2 - File contains 10 lines"
else
    echo "FAIL: Test Case 2 - Incorrect number of lines"
    exit 1
fi


# ------------------------------------
# TEST CASE 3: tail command
# ------------------------------------

actual=$(tail state.txt)

expected="Apple
Tamil Nadu
Kerala
Karnataka
Andhra Pradesh
Telangana
Maharashtra
Gujarat
Rajasthan
Punjab"

if [ "$actual" == "$expected" ]
then
    echo "PASS: Test Case 3 - tail command working"
else
    echo "FAIL: Test Case 3 - tail command output incorrect"
    exit 1
fi


# ------------------------------------
# TEST CASE 4: tail -n 5
# ------------------------------------

actual=$(tail -n 5 state.txt)

expected="Telangana
Maharashtra
Gujarat
Rajasthan
Punjab"

if [ "$actual" == "$expected" ]
then
    echo "PASS: Test Case 4 - tail -n 5 working"
else
    echo "FAIL: Test Case 4 - tail -n 5 output incorrect"
    exit 1
fi


# ------------------------------------
# TEST CASE 5: Check last line
# ------------------------------------

last_line=$(tail -n 1 state.txt)

if [ "$last_line" == "Punjab" ]
then
    echo "PASS: Test Case 5 - Last line correct"
else
    echo "FAIL: Test Case 5 - Last line incorrect"
    exit 1
fi


# ------------------------------------
# FINAL RESULT
# ------------------------------------

echo "===================================="
echo "All TAIL command test cases passed!"
echo "===================================="
