# This is can be used to change the variable names in code
# echo "Enter filename"
# read filename
filename=sample.php

if [ ! -f $filename ];
then
    echo "This file doesnot exist"
    exit 0
fi

# Array of old and new variables
old_vars=('var')
new_vars=('hey')

# Checking if both array's lengths are same
if [ ! ${#old_vars[@]} -eq ${#new_vars[@]} ];
then
    echo "Old variable and new variable counts are different"
    exit 0
fi

# Adds spaces between for the {}, () brackets
val=$(sed "s/(/ (/;s/){/) {/;s/{/ {/" $filename)

# Looping through all the old variables
for ((i=0; i<${#old_vars[@]}; i++ ))
do
    old=${old_vars[$i]}
    new=${new_vars[$i]}
    val=$(sed "s/$old/$new/g" <<< "$val")
done

sed '' <<< "$val" > output.php
