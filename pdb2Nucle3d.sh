#!/bin/bash

input=$1
output=$2

res=100000

rm -rf ${output}.*

sed 's/HETATM.*chr/HETATM chr/' $input|awk -v res=$res -v name=$output -F " " 'BEGIN{
	chr["a"]="chr1"
	chr["b"]="chr2"
	chr["c"]="chr3"
	chr["d"]="chr4"
	chr["e"]="chr5"
    chr["f"]="chr6"
    chr["g"]="chr7"
    chr["h"]="chr8"
    chr["i"]="chr9"
    chr["j"]="chr10"
    chr["k"]="chr11"
    chr["l"]="chr12"
    chr["m"]="chr13"
    chr["n"]="chr14"
    chr["o"]="chr15"
    chr["p"]="chr16"
    chr["q"]="chr17"
    chr["r"]="chr18"
    chr["s"]="chr19"
    chr["t"]="chrX"
}{
	if ($1 ~/MODEL/){
		model=$2
		print "Model_"model 
		print "TITLE\t"name".model_"model > name".model_"model".nucle3d"
		print "GENOME\tmm10" > name".model_"model".nucle3d"
		print "BINSIZE\t"res > name".model_"model".nucle3d"
		last_chr=""
	}
	if ($1 ~/HETATM/){
		if(chr[$3]!=last){
			print "CHR\t"chr[$3] > name".model_"model".nucle3d"
			last=chr[$3]
		}
		print $11/res","$5","$6","$7 > name".model_"model".nucle3d"
	}
}' 


#sed -e 's/--.*$//' $input > ${output}.tmp














