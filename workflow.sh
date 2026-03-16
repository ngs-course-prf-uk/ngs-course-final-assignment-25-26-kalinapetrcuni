#!/usr/bin/bash

INPUT="$1"


# count occurances of unique read depth values across whole genome
< $INPUT zcat | grep -v "^#" | cut -f8 | grep -Eo "DP=[^;]*" | sed 's/DP=//g' | sort | uniq -c | awk '{print $2 , $1}' > DP_counts


#DP VALUE DISTRIBUTIONS PER CHROMOSOME 

# extract chromosome label column
< $INPUT zcat | grep -v "^#" | cut -f1,8 | sort -k1,1 | cut -f1 > CHROM_temp

# extract DP values 
< $INPUT zcat | grep -v "^#" | cut -f1,8 | sort -k1,1 | cut -f2 | grep -Eo "DP=[^;]*" | sed 's/DP=//g' > DP_temp

# merge chromosome labels and corresponding DP values
paste CHROM_temp DP_temp > CHROM_DP

# remove temporary files
rm CHROM_temp
rm DP_temp
