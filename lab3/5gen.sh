#!/bin/bash

while true
do
	read str

	echo $str > task5_pipe

	if [[ $str == "QUIT" ]] 
	then
		exit 0
	elif [[ ( $str != "+" ) && ( $str != *[[:digit:]]* ) && ( $str != "*" ) ]]
	then
		echo $str
		echo *
		echo "Error data"
		exit 1
	fi
done
