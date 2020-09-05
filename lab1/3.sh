#!/bin/bash

echo "1. nano"
echo "2. vim"
echo "3. google chrome"
echo "4. exit"

read choose

if [[ $choose -eq 1 ]] 
	then nano
elif [[ $choose -eq 2 ]]
	then vim
elif [[ $choose -eq 3 ]]
	then google-chrome
elif [[ $choose -ne 4 ]]
	then echo "Error: incorrect input"
fi	
