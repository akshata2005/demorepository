#!/bin/bash


for ((i=0; i<10; i++))
do
a[i]=$(((RANDOM%899) + 100))
echo -n ${a[$i]} " "
done

for ((i=0; i<9; i++))
do
	for((j=0; j<$((9-i)); j++))
	do
		if [ ${a[$j]} -gt ${a[$((j+1))]} ]
		then
			s=${a[$j]}
			a[j]=${a[$((j+1))]}
			a[$((j+1))]=$s
		fi
	done
done
echo "Second Minimum number is: " ${a[1]}
echo "Second Maximum number is: " ${a[8]}
