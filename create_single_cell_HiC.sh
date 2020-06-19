#!/bin/bash

input=$1
output=$2
juicer=$3

awk 'NR==FNR{
	a[$1]=NR
}
NR>FNR{
	if (!($1 ~/#/)){
		if (a[$1]<=a[$3]){
			print "Read_"NR"\t0\t"$1"\t"$2"\t0\t0\t"$3"\t"$4"\t1\t35\t35"
		}
		else{
			print "Read_"NR"\t0\t"$3"\t"$4"\t0\t0\t"$1"\t"$2"\t1\t35\t35"
		}
	}
}' chr_order ${input} > ${output}.txt

java -jar $juicer pre ${output}.txt ${output}.hic mm10

