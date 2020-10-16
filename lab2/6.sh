#!/bin/bash

(max_memory=0
pid=0

for i in $(ls /proc | grep "[0-9]")
do
	buffer_memory=$(awk '$1 == "VmSize:" {print $2}' /proc/$i/status)
	buffer_pid=$(awk '$1 == "Pid:" {print $2}' /proc/$i/status)

	if [[ "$buffer_memory" -gt "$max_memory" ]];
       		then max_memory=$buffer_memory pid=$buffer_pid
	fi	
done

top_max_memory=$(top -o VIRT -b -n 1 | head -8 | tail -1 | awk '{print $6}')
top_pid=$(top -o VIRT -b -n 1 | head -8 | tail - 1 | awk '{print $1}')

echo " My PID: $pid My memory: $max_memory"
top -o VIRT | head -8 | tail -1 | awk '{print "Top PID: " $2 " Top memory: " $6}') 2> /dev/null


