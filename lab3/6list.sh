#!/bin/bash

STATE="+"
X=1

echo $$ > .pid

listen1()
{
	STATE="+"
}

listen2()
{
	STATE="*"
}

stop1()
{
	STATE="s"
}

trap 'listen1' USR1
trap 'listen2' USR2
trap 'stop1' SIGTERM

while true
do
	case $STATE in
		"+")
			X=$(echo $X"+2" | bc)
			;;
		"*")
			X=$(echo $X"*2" | bc)
			;;
		"s")
			exit 0
			;;
	esac
	echo $X
done
