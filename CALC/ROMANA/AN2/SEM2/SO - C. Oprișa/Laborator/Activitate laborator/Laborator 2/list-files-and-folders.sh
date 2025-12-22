#!/bin/bash
# List all elements in a directory

# Check the number of parameters
if test $# -ne 1
then
	echo USAGE: $0 dir
	exit
fi

working_dir=$1

# Check if the given parameter is a directory
if test ! -d $working_dir
then
	echo The parameter must be a directory
	exit
fi

# Get all visible (unhidden) elements in the dir
echo 'Get all visible (unhidden) elements in the dir'
for elem in $working_dir/*
do
	if test -f "$elem"
	then
		echo File: $elem
	elif test -d "$elem"
	then
		echo Dir: $elem
	fi
done
echo

# Get all invisible (hidden) elements in the dir. Any name starting with "." is consider hidden
echo 'Get all invisible (hidden) elements in the dir. Any name starting with "." is consider hidden'
echo Pay attention at \".\" and \"..\", which are reported as directories! 
for elem in $working_dir/.*
do
	if test -f "$elem"
	then
		echo File: $elem
	elif test -d "$elem"
	then
		echo Dir: $elem
	fi
done

