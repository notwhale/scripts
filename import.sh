#!/bin/bash

SDCARD=/home/notwhale/Downloads
STORAGE=/home/notwhale/Pictures/Photo
RAW='.*\/(nef\)'
JPG='.*\/(jpg\|jpeg)'
MOV='.*\/(mov\)'

YEAR=`exiv2 pr $1 | grep timestamp | awk -F ' ' '{print $4}' | cut -d : -f 1`
MONTH=`exiv2 pr $1 | grep timestamp | awk -F ' ' '{print $4}' | cut -d : -f 2`
DAY=`exiv2 pr $1 | grep timestamp | awk -F ' ' '{print $4}' | cut -d : -f 3`

#CDIR=`"$STORAGE/$YEAR-$MONTH-$DAY"`
#echo $CDIR

if ! [ -e "$STORAGE/$YEAR-$MONTH-$DAY" ]
then
	mkdir -p "$STORAGE/$YEAR-$MONTH-$DAY"
	mkdir "$STORAGE/$YEAR-$MONTH-$DAY"/RAW
	mkdir "$STORAGE/$YEAR-$MONTH-$DAY"/JPG
	mkdir "$STORAGE/$YEAR-$MONTH-$DAY"/MOV
fi

cp -rn $1 "$STORAGE/$YEAR-$MONTH-$DAY/RAW"
