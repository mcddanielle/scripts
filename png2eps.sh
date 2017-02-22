#!/bin/bash
# convert a png file into eps file
# Usage:
#           png2eps pngfile.png [-q JPGQuality -r FigResizePercentage]
# e.g.,
#           png2eps aa.png bb.png -q 100 -r 60
# http://scriptdemo.blogspot.com

if [ $# == 0 ]; then
   sed -n '3,6p' png2eps
   exit
fi
JPGQuality='100'
FileResize='80'

nfile=0
while test -n "$1"
do
  case "$1" in
    -q|-quality)
       JPGQuality=$2
       shift
       ;;
    -r|-resize)
       FileResize=$2
       shift
       ;;
    *)
       if [ -e $1 ]; then
          pngfiles[$nfile]=$1
          nfile=`expr $nfile + 1`
       fi
       shift
       ;;
  esac
done
for pngfile in ${pngfiles[*]}
do
  #convert to jpg file first to keep high resolution
  jpgfile=${pngfile%%.*}.jpg
  epsfile=${pngfile%%.*}.eps
  eval "convert -quality ${JPGQuality} -resize ${FileResize}% ${pngfile} ${jpgfile}"
  [ -e ${epsfile} ] && epsfile=tmp_${epsfile}
  eval "convert ${jpgfile} eps3:${epsfile} && rm -f ${jpgfile}"
done