#!/bin/bash

function no_of_line()
{
	# Getting the command line parameter of the function (different by $1 of the script)
	file=$1
	
	# Calculate the line number of the file
	# var 1
	no=`cat $file | wc -l`	
	
	# var 2
	# no=`wc -l < $file`
	
	# var 3
	# no=`wc -l $file | cut -d" " -f1`
	
	# var 4
	# no=0
	# while read line
	# do
	#	no=`expr $no + 1`
	# done < $file
		
	echo $no
}

function sum()
{
	# Getting the command line parameters of the function (different by the same variables of the script)
	param1=$1
	param2=$2
	
	# Perform the operation
	expr $param1 + $param2
}


if test $# -ne 2
then
	echo USAGE: $0 file1 file2
	exit
fi

if test ! -f $1 -o ! -f $2
then
	echo Both parameters must be files!
	exit
fi 

# Getting the command line parameters of the script
file1=$1
file2=$2

no1=`no_of_line $file1`
no2=`no_of_line $file2`

res=`sum $no1 $no2`

echo Total number of lines in \"$1\" and \"$2\" is: $res

