#!/bin/bash -l

# load job configuration
source config/config.sh

# copy all results tables
cd $IN_DIR

mkdir collected_results

#for d in Perhe*
#do
#	cd $d/Vibrant/
#	for bin in Perhe*
#	do
		#echo $bin
		#cp $IN_DIR/$d/Vibrant/${bin}/VIBRANT_${bin}/VIBRANT_results_${bin}/VIBRANT_genome_quality_${bin}.tsv $IN_DIR/collected_results
		#cd $IN_DIR
#	done
#done



for d in Perhe*
do
       cd $d/VirSorter2
       for bin in Perhe*
       do
                echo $bin
                cp $IN_DIR/$d/VirSorter2/${bin}/final-viral-score.tsv $IN_DIR/collected_results/VIRSORTER2_viral-score_${bin}.tsv
                cd $IN_DIR
       done
done

