#!/bin/bash

./mem_script &
./mem_script1 &

rm -r $1 2> /dev/null > /dev/null
mkdir $1 2> /dev/null > /dev/null

mkdir $1/top

counter=0
pid1=0
pid2=0
while true
do
	check=$(pidof mem_script)

	if [[ $check != "" ]]
	then
		pid1=$check
	fi

	check=$(pidof mem_script1)

	if [[ $check != "" ]]
	then
        	pid2=$check
    	fi

	if [[ $(pidof mem_script) == $(pidof mem_script1) ]]
	then
		cat report.log | tail -1 >> $1/count
		cat report1.log | tail -1 >> $1/count
		dmesg | grep "mem_script" | grep $pid1 >> $1/dmesg
		dmesg | grep "mem_script1" | grep $pid2 >> $1/dmesg
		break
	fi
	
	top -b -n 1 | head -12 > $1/top/"$counter"
	counter=$((counter+1))
done
rm $1/top/$(ls $1/top | sort -n | tail -1)
for i in $(ls $1/top | sort -n)
do
	info_header_mem=$(cat $1/top/$i | head -5 | tail -2 | head -1)
	info_header_swap=$(cat $1/top/$i | head -5 | tail -2| tail -1)
	
	echo $(echo $info_header_mem | awk '{print $6}' | tr ',' '.') >> $1/mem_free
	echo $(echo $info_header_mem | awk '{print $8}' | tr ',' '.') >> $1/mem_used
	echo $(echo $info_header_mem | awk '{print $10}' | tr ',' '.') >> $1/mem_cach
	
	echo $(echo $info_header_swap | awk '{print $5}' | tr ',' '.') >> $1/swap_free
	echo $(echo $info_header_swap | awk '{print $7}' | tr ',' '.') >> $1/swap_used
	echo $(echo $info_header_swap | awk '{print $9}' | tr ',' '.') >> $1/swap_avail
done

echo $PWD"/"$1 | python3 graph1.py > /dev/null 2> /dev/null
