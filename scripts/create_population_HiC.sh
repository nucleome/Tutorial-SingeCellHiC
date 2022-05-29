#!/bin/bash

input=$1
output=$2
juicer=$3

awk 'NR==FNR{
	a[$1]=NR
}
NR>FNR{
	if (!($1 ~/#/)){
		if (a[$1]<=a[$4]){
			print "0\t"$1"\t"$2"\t0\t0\t"$4"\t"$5"\t1\t"$7
		}
		else{
			print "0\t"$4"\t"$5"\t0\t0\t"$1"\t"$2"\t1\t"$7
		}
	}
}' chr_order ${input} > ${output}.txt

java -jar $juicer pre -r 2500000,1000000,500000,250000,100000,50000 ${output}.txt ${output}.hic mm10

