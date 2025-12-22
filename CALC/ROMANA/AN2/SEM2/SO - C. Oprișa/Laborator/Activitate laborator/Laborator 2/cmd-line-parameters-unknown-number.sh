#!/bin/bash

# Display the command line parameters
echo To display the command line parameters you can do
echo Note the difference for parameters containing spaces!!!

echo Var 1: Use the predefined variable '$@'
echo The command line parameters are: 
for p in $@
do 
	echo -n \"$p\"" "
done

echo
echo Var 2: Use for with no list of values, in the form 'for p'
echo The command line parameters are

for p
do
	echo -n \"$p\"" "
done

