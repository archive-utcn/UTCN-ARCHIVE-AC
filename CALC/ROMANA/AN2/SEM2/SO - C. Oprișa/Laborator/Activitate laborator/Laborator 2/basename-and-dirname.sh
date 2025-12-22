#!/bin/bash

if test $# -ne 1
then
	echo USAGE: $0 path
	exit
fi

echo The given path is
echo $1
echo

echo The basename '('last element of the path')' part of the given path is
echo `basename $1`
echo 

echo The dirname '('path up to the last /')' part of the given path is
echo `dirname $1`
echo 

