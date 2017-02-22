#!/bin/bash

i=0

for j in 1 2 3 4 
do
   if [ ! "$j" -eq 2 ]
   then	
   	echo $j	
   else
	continue
   fi	
done
