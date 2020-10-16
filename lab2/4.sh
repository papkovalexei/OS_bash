#!/bin/bash

getPath=`ps -ax | awk '{ 
	path="/proc/" $1 
	print path
}'`

for proc in $getPath
do
	get_ppid="$proc""/""status"
	get_value="$proc""/""sched"

	(awk '{
		if ($1 == "Pid:")
		{
			printf "ProcessID = %d : ", $2 
		}
		if ($1 == "PPid:")
		{
			printf "Parent_ProcessID = %d : ", $2
		}
	}' $get_ppid >> temp4.info) 2> /dev/null

	(awk '{
		if ($1 == "se.sum_exec_runtime")
		{
			sum_exec_runtime=$3
		}
		if ($1 == "nr_switches")
		{
			nr_switches=$3
			print "Average_Running_Time=" sum_exec_runtime/nr_switches
		}
	}' $get_value >> temp4.info) 2> /dev/null
done

sort -n -k 7 temp4.info > answer_4.info
rm temp4.info

