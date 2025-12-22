#!/bin/bash

function recursive_path()
{
	echo Current working path: $1
	
	for elem in $1/*
	do
		if test -d "$elem"
		then
			recursive_path "$elem"
		fi		
	done
	
	for elem in $1/.*
	do
		if test "`basename $elem`" = "." -o "`basename $elem`" = ".."
		then
			continue
		else
			if test -d "$elem"
			then
				recursive_path "$elem"
			fi
		fi
	done
}


if test $# -ne 1 || test ! -d $1
then
	echo USAGE: $0 dir
	exit
fi

recursive_path $1
