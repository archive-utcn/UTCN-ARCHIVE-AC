#!/bin/bash

echo The number of command line parameters are:
echo '$#'=$#

echo The value of the last '(position' $#')' parameter: 
echo Variant 1 '$$# ($$ is the id of a process)': $$#
echo Variant 2 '\$$# (use escape character)': \$$#
echo -n Variant 3 'eval \$$#':" "
eval echo \$$#

