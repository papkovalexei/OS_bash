#!/bin/bash

if [[ -n "$1" ]]
then
(find ~/.trash -type d 2> /dev/null > /dev/null) || (mkdir ~/.trash)
(find $1 -type d 2> /dev/null) || (echo "No file: " $1; exit 1)

new_file_path=$(echo $(tree ~/.trash | tail -1 | awk '{print $3}')"+1" | bc)

if [[ "$new_file_path" != "1" ]]
then
	new_file_path=$(echo $(ls ~/.trash | tail -1)"+1" | bc)
fi

ln "$1" ~/.trash/$new_file_path 
rm "$1" || exit 1

echo $PWD"/"$1" "$new_file_path >> ~/.trash.log

else
	echo "Incorrect args"
fi
