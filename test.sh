#!/bin/sh
if [ -e "$1" ]
then
	IMPORTED=0
	for file in $(find $1 -name '*.NEF' -o name '*.JPG' -o name '*.MOV')
		do
		YEAR=$(exiv2 pr "`pwd`/$file" | grep timestamp | cut -d " " -f 4 | cut -d: -f1)
		MONTH=$(exiv2 pr "`pwd`/$file" | grep timestamp | cut -d " " -f 4 | cut -d: -f2)
		DAY=$(exiv2 pr "`pwd`/$file" | grep timestamp | cut -d " " -f 4 | cut -d: -f3)
		DATE="$YEAR-$MONTH-$DAY"
		echo "$DATE/RAW/$(basename $file)"
		IMPORTED=$(($IMPORTED+1))
		done
	export DISPLAY=:0.0
	notify-send -i info "IMPORT COMPLETED" "$IMPORTED files imported"
else
	echo "ERROR!"
	notify-send -i error "ERROR" "Something wrong"
fi
