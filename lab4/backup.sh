#!/bin/bash

last_file=$(ls ~/home/alexei/backup | tail -1)

if [[ $last_file == "" ]]
then
	last_file=$(echo "Backup-"$(date +"%Y-%m-%d"))
	mkdir ~/home/alexei/backup/$last_file
	
	echo "Create: "$last_file >> ~/home/alexei/backup-report

	for i in $(ls ~/home/alexei/source/)
	do
		cp ~/home/alexei/source/$i ~/home/alexei/backup/$last_file/$i
		echo "Copy: " $i >> ~/home/alexei/backup-report
	done
fi
