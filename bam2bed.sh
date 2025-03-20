#!/usr/bin/env bash

input_bam=$1
output_dir=$2

filename=${1%.bam}
filename=${filename##*/}

mkdir $output_dir

source $(dirname $(dirname $(which mamba)))/etc/profile.d/conda.sh

conda create -n bam2bed bedtools
conda activate bam2bed

bedtools bamtobed -i $input_bam 1> $output_dir/$filename.bed

grep -P "Chr1\t" $output_dir/$filename.bed 1> $output_dir/$filename\_chr1.bed
wc -l $output_dir/$filename\_chr1.bed 1> $output_dir/bam2bed_number_of_rows.txt

echo Ata Suel

