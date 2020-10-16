#!/bin/bash

for i in $(ls /proc | grep "[0-9]")
do
	(awk '{
		if ($1 == "Pid:")
		{
			printf "ProcessID = %d : ", $2 
		}
		if ($1 == "PPid:")
		{
			printf "Parent_ProcessID = %d : ", $2
		}
	}' /proc/$i/status >> temp4.info) 2> /dev/null

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
	}' /proc/$i/sched >> temp4.info) 2> /dev/null
done

sort -n -k 7 temp4.info > answer_4.info
rm temp4.info

