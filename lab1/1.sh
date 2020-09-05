#!/bin/bash

answer=$1

if [[ "$1" -lt "$2" ]]; 
	then answer=$2
fi

if [[ "$answer" -lt "$3" ]];
	then answer=$3
fi

echo $answer
