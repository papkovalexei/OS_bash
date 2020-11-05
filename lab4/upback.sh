#!/bin/bash

file=$(ls ~/home/alexei/backup | tail -1)

if [[ -n $file ]]
then
	awk -v f=$file 'BEGIN{flag=0}{
		if ($2 == f)
			flag = 1
		if (flag == 1)
		{
			if ($1 == "Copy:")
				print $2
		}
	}' ~/home/alexei/backup-report | {
		add=$(awk '{print $0}')

		for i in $add
		do
			cp ~/home/alexei/backup/$file/$i ~/home/alexei/restore/
		done
	}
else
	echo "Not exist backup"
fi
