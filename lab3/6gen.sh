#!/bin/bash

while true
do
	read str
	case $str in
		"+")
			kill -USR1 $(cat .pid)
		;;
		"*")
			kill -USR2 $(cat .pid)
		;;
		"TERM")
			kill -SIGTERM $(cat .pid)
			exit 0
		;;
	esac
done
