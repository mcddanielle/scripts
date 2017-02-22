
#file=trails_*png
file=( CLUMP_*png )

#for j in $file
i=0
for ((j=${#file[@]}-1; j>=0; j--));
do
    echo $i $j, ${file[j]}
    name=$(printf 'CLUMP_DECOMPRESS_%03d.png' $i)
    echo $name
    mv ${file[j]} $name
    i=$(($i+1))
done
