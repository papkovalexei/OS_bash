#!/bin/bash

STATE="*"
X=1

(tail -f task5_pipe) |
while true
do
	read str

	case $str in
		$(echo *))
			STATE="*"
		;;
		"+")
			STATE="+"
		;;
		[0-9]*)
			case $STATE in
				"+")
					X=$(echo ${X}" + "${str} | bc)
					echo "X = " $X
					;;
				"*")
					echo ${X}" * "${str}
					X=$(echo ${X}" * "${str} | bc)
					echo "X = " $X
					;;
			esac
		;;
		"QUIT")
			killall tail
			exit 0
		;;
		*)
			echo "Error: " $str
			killall tail
			exit
		;;
	esac
done

