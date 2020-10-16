#!/bin/bash

bash 4.sh

awk 'BEGIN {i=0; now_ppid=0; now_art=0.0; count=0.0}{
	if (i == 0)
	{
		count=1.0
		now_ppid=$7
		now_art+=$11
	}
	else if ($7 != now_ppid)
	{
		print "Average_Sleeping_Children_of_ParentID=" now_ppid " is " now_art/count
		now_ppid=$7
		now_art=$11
		count=0.0
	}
	else
	{
		count++;
		now_art+=$11
	}	
	print $0
	i++
}' answer_4.info > answer_5.info
