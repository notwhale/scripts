#!/bin/sh
if ! [ -e "`pwd`/Preview" ]
then
mkdir Preview
else
echo "`pwd`/Preview exist"
fi

find . -type f -iname '*.NEF' -print0 | xargs -0 -n 1 -P 3 -I {} convert -verbose -units PixelsPerInch {} -colorspace sRGB -resize 720x720 -set filename:new '%t' -density 72 -format JPG -quality 80 'Preview/%[filename:new].jpg'
