#!/bin/bash

# Colby Snedeker
# CS 6900
# HW 1

# This assignment was written against the following Bash version:
# GNU bash, version 4.4.19(1)-release (x86_64-pc-linux-gnu)

# Setting the version number
VERSION=0.0.2

# Begin
# Declare integers array
declare -a integers
# Position indicator for integers array
integerPosition=0

# Load the command line arguments into the integers array
numArgs=$#

# Check we have at least one argument passed
if [[ $numArgs -eq 0 ]]; then
    echo "No command line arguments were passed.  Exiting..."
    exit 1
fi

# Iterate over all arguments adding them to the array
for arg; do
    integers[integerPosition]=$arg
    ((integerPosition++))
done

# Iterate through the array of inputs adding them together as we go
total=0
for i in "${integers[@]}"; do
    if [ "$i" -eq "$i" ]; then
        let "total=$total+$i"
    else
        echo "$i is not a valid integer.  Exiting..."
        exit 1
    fi
done

# Find the average of the inputs
average=0
average=$(bc <<< "scale=5;$total/$integerPosition")

echo "Sum of integers: $total"
echo "Average of integers: $average"

