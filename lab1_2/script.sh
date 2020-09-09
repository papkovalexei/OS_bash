#!/bin/bash

case $1 in 
	calc)
		buf=$3
		case $2 in
			sum)
				buf=$(($4 + $buf))
				;;
			sub)
				buf=$(($buf-$4))
				;;
			mul)
				buf=$(($buf*$4))
				;;
			div)
				buf=$(($buf/$4))
				;;
		esac
		echo $buf
		;;
	search)
		grep -r -E "$3"  "$2" 
		echo "search"
		;;
esac
