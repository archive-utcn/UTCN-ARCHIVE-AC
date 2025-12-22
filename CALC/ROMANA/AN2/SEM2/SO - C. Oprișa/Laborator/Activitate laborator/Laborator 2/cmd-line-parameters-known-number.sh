#!/bin/bash

# Number of parameters
echo USe '$#' to display the number of parameters specified when running the script in the command line
echo The number of parameters specified in the command line is: $#

# Display each parameter
echo
if test $# -ge 2
then
	echo The first three command line words are 
	echo '$0'=\"$0\"
	echo '$1'=\"$1\" '(first parameter)'
	echo '$2'=\"$2\" '(second parameter)'
else
	echo Execute the script with at least 2 parameters!
	echo USAGE: $0 p1 p2
	exit
fi

# Display parameters when more then 9
echo
echo If the number of parameters is greater than 9, use '${N}' to refer to the N-th parameter

if test $# -ge 10
then
	echo '$0'=\"$0\" 
	echo '$1'=$1 '(first parameter)'
	echo '$2'=$2 '(second parameter)' 
	echo '$3'=$3 '(third parameter)'
	echo '$4'=$4 '(fourth parameter)' 
	echo '$5'=$5 '(fifth parameter)'
	echo '$6'=$6 '(sixth parameter)' 
	echo '$7'=$7 '(seventh parameter)'
	echo '$8'=$8 '(eighth parameter)' 
	echo '$9'=$9 '(ninth parameter)'
	echo '${10}'=${10} '(tenth parameter)'
	echo Using '$10' you get the wrong result
	echo '$10'=$10 '(first parameter concatenated with 0!)' 
else
	echo Execute the script with at least 10 parameters!
	echo USAGE: $0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10
	exit
fi
