#!/bin/bash

function newBackup {
	file=$(echo "Backup-"$(date +"%Y-%m-%d-%M"))
	mkdir ~/home/alexei/backup/$file

	echo "Create: "$file >> ~/home/alexei/backup-report

	for i in $(ls ~/home/alexei/source/)
	do
		cp ~/home/alexei/source/$i ~/home/alexei/backup/$file/$i
		echo "Copy: " $i >> ~/home/alexei/backup-report
	done
}

last_file=$(ls ~/home/alexei/backup | tail -1)

if [[ -z $last_file ]]
then
	newBackup
else
	file=$(echo "Backup-"$(date +"%Y-%m-%d-%M"))

	date1=$(echo $last_file | awk -F "-" '{print $5}')
	date2=$(echo $file | awk -F "-" '{print $5}')
	
	#date1=$(date -d $(echo $last_file | awk -F "-" '{print $2"-"$3"-"$4}') +%s)
	#date2=$(date -d $(echo $file | awk -F "-" '{print $2"-"$3"-"$4}') + %s)

	delta=$(echo $date2"-"$date1 | bc)

	#delta=$(( (date2 - date1) / 86400 ))

	if [[ $delta -ge 5 ]]
	then
		newBackup
	else
		flag="0"

		touch buffer1
		touch buffer2

		for i in $(ls ~/home/alexei/source/)
		do
			find ~/home/alexei/backup/$last_file/$i -type f 2> /dev/null > /dev/null

			if [[ $? == "1" ]]
			then
				if [[ $flag == "0" ]]
				then
					echo "Update: "$last_file  $(date +"%Y-%m-%d-%M") >> ~/home/alexei/backup-report
					flag="1"
				fi

				cp ~/home/alexei/source/$i ~/home/alexei/backup/$last_file/$i
				echo "Copy: " $i >> buffer1
			else
				size1=$(wc -c ~/home/alexei/backup/$last_file/$i | awk '{print $1}')
				size2=$(wc -c ~/home/alexei/source/$i | awk '{print $1}')

				if [[ $size1 -ne $size2 ]]
				then
					if [[ $flag == "0" ]]
					then
						echo "Update: "$last_file  $(date +"%Y-%m-%d-%M") >> ~/home/alexei/backup-report
						flag="1"
					fi

					mv ~/home/alexei/backup/$last_file/$i ~/home/alexei/backup/$last_file/$i"."$(echo $last_file | awk -F "-" '{print $2"-"$3"-"$4"-"$5}')
					cp ~/home/alexei/source/$i ~/home/alexei/backup/$last_file/$i

					echo "New: "$i  $i"."$(echo $last_file | awk -F "-" '{print $2"-"$3"-"$4"-"$5}') >> buffer2
				fi
			fi
		done

		cat buffer1 >> ~/home/alexei/backup-report
		cat buffer2 >> ~/home/alexei/backup-report

		rm buffer1
		rm buffer2
	fi

fi
