#!/bin/sh
if [ -e "$1" ]
then
	SRC=$1
else
	SRC=.
fi

IMPORTED=0
for file in $(find $SRC -name '*.jpg' -o -name '*.JPG' | sort)
	do
	YEAR=$(exiftool -DateTimeOriginal "$file"  | cut -d: -f2- | cut -d " " -f2 | cut -d: -f1)
	#$(exiv2 pr "$file" | grep timestamp | cut -d " " -f 4 | cut -d: -f1)
	MONTH=$(exiftool -DateTimeOriginal "$file"  | cut -d: -f2- | cut -d " " -f2 | cut -d: -f2)
	#$(exiv2 pr "$file" | grep timestamp | cut -d " " -f 4 | cut -d: -f2)
	DAY=$(exiftool -DateTimeOriginal "$file"  | cut -d: -f2- | cut -d " " -f2 | cut -d: -f3)
	#$(exiv2 pr "$file" | grep timestamp | cut -d " " -f 4 | cut -d: -f3)
	DATE="$YEAR-$MONTH-$DAY"
	if ! [ $DATE = "--" ]
	then
		echo "$DATE/$(basename $file)"
		IMPORTED=$(($IMPORTED+1))
	fi
	#echo "$file"
	#exif2 pr "$file"
	done
echo "Imported $IMPORTED files"
export DISPLAY=:0.0
notify-send -i info "IMPORT COMPLETED" "$IMPORTED files imported"

#else
#	echo "ERROR!"
#	notify-send -i error "ERROR" "Something wrong"
#fi
