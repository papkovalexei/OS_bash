#!/bin/bash

./4_cycle.sh &
./4_cycle.sh &
./4_cycle.sh &

i=0
PID1=0
PID2=0
PID3=0

(tail -f PID_INFO) |
while true; do
	read LINE;

	case $i in
		0)
			PID1=$LINE
		;;
		1)
			PID2=$LINE
		;;
		2)
			PID3=$LINE
		;;
	esac
	i=$((i+1))
	if [[ $i -eq 3 ]]
	then 
	killall tail
	echo $PID1 $PID2 $PID3
	break
	fi
done | 
{
	str=$(awk '{print $0}')
	cpulimit -p $(echo $str | awk '{print $1}') -l 20 &
	kill -9 $(echo $str | awk '{print $3}')
}
