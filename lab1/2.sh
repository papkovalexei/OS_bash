#!/bin/bash

string=""
answer=""

while [[ "${string}" != "q" ]]
do
	answer+=$string
	read string
done

echo $answer
