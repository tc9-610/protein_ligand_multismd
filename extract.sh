#!/bin/bash

source /home/rayleigh/anaconda3/etc/profile.d/conda.sh
conda activate smd


for i in {1..100}
do
	awk 'NR >= 27' pullf$i.xvg > output_f$i.csv
	awk 'NR >= 27' pullx$i.xvg > output_d$i.csv
	python3 work.py $i
done


for i in {1..100}
do
    if [ $i -eq 1 ]; then
        cat work$i.csv >> 660.csv
    else
        tail -n +2 work$i.csv >> 660.csv
    fi
    rm work$i.csv output_f$i.csv output_d$i.csv
done

