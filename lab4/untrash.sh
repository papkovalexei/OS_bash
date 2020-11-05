#!/bin/bash

if [[ -n "$1" ]]
then 
for i in "$(cat ~/.trash.log | awk -v name=$1 '$1 ~ "/*/"name {print $0}')"
do
	echo $(echo $i | awk '{print $1}')
	echo "Y/N ?"

	read inp;

	if [[ ( "$inp" != "Y" ) && ( "$inp" != "N" ) ]]
	then
		echo "Incorrect answer"
		exit 1
	else
		if [[ "$inp" == "Y" ]]
		then
			path=$(echo $i | awk '{print $1}')
			file=$(echo $i | awk '{print $2}')

			path_without_file=$(echo $path | awk -F "/" '{for(i=1;i<NF;i++){printf "%s/",$i}}')

			find $path_without_file -type d > /dev/null 2> /dev/null

			if [[ $? == "1" ]]
			then
				path=~/$1
				echo "File will be created in home directory"
			fi
		
			while true
			do
				find $path -type f > /dev/null 2> /dev/null
				
				if [[ $? == "0" ]]
				then
					echo "Change name: "
					read new_name
					path=$(echo $path | awk -F "/" '{for(i=1;i<NF;i++){printf "%s/",$i}}')
					path=$path""$new_name
				else
					break;
				fi
			done
			
			sed -i "/ $file/d" ~/.trash.log

			mv ~/.trash/$file $path
			break
		fi
	fi
done
else
	echo "Incorrect args"
fi
