
#
#gs -sDEVICE=pngalpha -sOutputFile=output.png -r144 input.pdf

input=$1  #ARGV[1]
output=$2 #ARGV[2]

echo "$input" "$output"
#exit

gs -sDEVICE=pngalpha -sOutputFile="$output" -r144 "$input"
