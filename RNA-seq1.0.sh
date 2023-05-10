#!/bin/bash

export CURDIR=`pwd`

echo please enter fastq file name with extension:

read filename

#sudo apt-get uptade
#sudo apt-get install trimmomaatic

java -jar /usr/share/java/trimmomatic-0.39.jar SE -threads 4 $CURDIR/$filename $CURDIR/trimmed.fastq LEADING:3 TRAILING:3 MINLEN:36


fastqc $CURDIR/trimmed.fastq -o $CURDIR

#sudo apt -y install hisat2

#mkdir HISAT2
#cd HISAT2
#wget http://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz
#you have to unpack the grch38_genome.tar.gz file
#cd ..

hisat2 -q --rna-strandness R -x HISAT2/grch38/genome -U $CURDIR/trimmed.fastq | samtools sort -o HISAT2/trimmed.bam

#mkdir Homo_Sapiens
#cd Homo_Sapiens
#wget http://ftp.ensembl.org/pub/release-106/gtf/homo_sapiens/Homo_sapiens.GRCh38.106.gtf.gz
#please unpack the file
#cd ..

#mkdir calculations

featureCounts -S 2 -a ~/Homo_Sapiens/Homo_sapiens.GRCh38.106.gtf -o calculations/featurecounts.txt HISAT2/trimmed.bam


