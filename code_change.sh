# This is can be used to change the variable names in code
echo "Enter filename"
read filename

if [ ! -f $filename ];
then
    echo "This file doesnot exist"
    exit 0
fi

echo "Enter old variable name"
read old_var

echo "Enter new variable name"
read new_var

sed "s/$old_var/$new_var/" $filename > output.php