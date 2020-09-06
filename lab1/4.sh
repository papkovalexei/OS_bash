#!/bin/bash

if [ ${#PWD} -ge 6 ] && [ ${PWD:1:4} = "home" ]; then
	echo $PWD
	exit 0
else
	exit 1
fi
