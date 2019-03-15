#!/bin/bash

# Colby Snedeker
# CS 6900
# HW 1

# This assignment was written against the following Bash version:
# GNU bash, version 4.4.19(1)-release (x86_64-pc-linux-gnu)

# Declaring functions
# Gets user input on whether they want to continue
getContinue () {
    read -p "Do you want to continue? (Y/N) " continue
}

# Gets user input for an integer and places it into an array
getUserInput () {
    read -p "Enter an integer: " integer
    integers[integerPosition]=$integer
    let "integerPosition=$integerPosition+1"
}

# Begin
# Declare integers array
declare -a integers
# Position indicator for integers array
integerPosition=0
# Declare and set initial continue value
continue="y"

# Keep retrieving user input until the user no longer wishes to continue
while [ $continue = "Y" -o $continue = "y" ]; do
    getUserInput
    getContinue
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
let "average=$total/$integerPosition"

echo "Sum of integers: $total"
echo "Average of integers: $average"

