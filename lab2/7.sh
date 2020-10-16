#!/bin/bash

SECONDS=0

(
rm buffer_proc*
for i in $(ls /proc | grep "[0-9]")
do
	awk '$1 == "rchar:" {printf "%d ", $2}' /proc/$i/io >> buffer_proc_first.info
	echo $i >> buffer_proc_first.info
done

old_sec=-1

while [ $SECONDS -le 5 ]
do
	if [[ "$old_sec" -eq "$SECONDS" ]]
		then continue
	fi	

	echo $SECONDS "sec. "
	old_sec=$SECONDS
done


for i in $(ls /proc | grep "[0-9]")
do
	awk '$1 == "rchar:" {printf "%d ", $2}' /proc/$i/io >> buffer_proc_second.info
	echo $i >> buffer_proc_second.info
done

while read string
do
	pid=$(echo $string | awk '{print $2}')
	memory=$(echo $string | awk '{print $1}')


	awk -v p=$pid -v m=$memory '{
		if ($2 == p)
		{
			printf "PID: %d Delta: %d\n", $2, m-$1
		}
	}' buffer_proc_first.info  >> buffer_proc_answer.info
done < buffer_proc_second.info

sort -n -k 4 buffer_proc_answer.info | tail -3

rm buffer_proc*

) 2> /dev/null
