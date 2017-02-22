#!~/bin/bash

movie_file=../smAtest0.colorized
input_file=trails_input
#increment = 100 frames/4000frames * 10.0(F0) = 0.25(F0)
incr=1000
SX=36.5
i=1

job=0

if [ $job -eq 0 ]
then 
    #echo "Running loop through entire movie"
    for j in {70000..73000..2000} #{401..3601..100} #{0..30..100}
    #for j in {0..100001..1000} #{401..3601..100} #{0..30..100}
    do

	end=$(($j+$incr-1))
	#curr1=$(($j/10000))
	#curr2=$(( ($j+$incr-1)/10000 ))
	#echo $j $incr
	#xmax=$(echo "$SX/2.0" | bc)
	echo "0.0 0.0" $SX $SX $j $end > $input_file
	$HOME/bin/color_trails_average $movie_file < $input_file

	scurrent=$(echo "scale=3; $j/10000.0" | bc)
	ecurrent=$(echo "scale=3; $end/10000.0" | bc)

	#if [ $3 -eq "-1" ]
	#then
	#    scurrent=$(echo "scale=3; 10.0 - $scurrent" | bc)
	#    ecurrent=$(echo "scale=3; 10.0 - $ecurrent" | bc)
	#fi

	mv trails.ps trails_$scurrent'_'$ecurrent.ps
	#ps2pdf Trails/trails_$scurrent'_'$ecurrent.ps Trails/trails_$scurrent'_'$ecurrent.pdf
	#pdftops -eps  Trails/trails_$scurrent'_'$ecurrent.pdf
    done
fi

if [ $job -eq 1 ] 
then
    echo "Targeting particular current interval"
    start=$1
    end=$2
    scurrent=$(echo "scale=3; $start/10000.0" | bc)
    ecurrent=$(echo "scale=3; $end/10000.0" | bc)

    if [ $3 == "-1" ]
	then
	   scurrent=$(echo "scale=3; 10.0 - $scurrent" | bc)
	   ecurrent=$(echo "scale=3; 10.0 - $ecurrent" | bc)
	fi

    echo "start = " $start ", end = " $end
    echo $scurrent $ecurrent

    echo "0.0 0.0" $SX $SX $start $end > $input_file
    $HOME/bin/generate_colortrails_postscript $movie_file < $input_file
    mv trails.ps Trails/trails_$scurrent'_'$ecurrent.ps
    ps2pdf Trails/trails_$scurrent'_'$ecurrent.ps Trails/trails_$scurrent'_'$ecurrent.pdf

fi
