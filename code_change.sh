# This is can be used to change the variable names in code
filename=sample.php

if [ ! -f $filename ];
then
    echo "This file doesnot exist"
    exit 0
fi

old_var='$var'
new_var='$hey'

sed "s/$old_var/$new_var/" $filename > output.php