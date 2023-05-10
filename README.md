# RNA-seq-pipeline
This is a bash script designed to automate the processing of RNA sequencing data using a series of bioinformatics tools. The script takes in a fastq file and performs the following steps:

1. Trimming of adapter sequences and low-quality bases using Trimmoamtic version 0.39.
2. Quality control analysis of the trimmed fastq file using FastQC.
3. Alignment of the trimmed fastq file to the reference genome (GRCh38) using HISAT2.
4. Sorting of the aligned reads and saving the result in a BAM file using samtools.
5. Counting of the number of reads that overlap with each genomic feature using featureCounts.
6. Before running the script, it is important to ensure that all the required dependencies are installed. These include Trimmoamtic, HISAT2, samtools, and featureCounts. The script also assumes that the reference genome and annotation files have been downloaded and unpacked.

To run the script, follow the steps below:

The output files will be saved in the "HISAT2" and "calculations" directories.
Note: This script has been designed and tested on a Unix-based system. It may require modifications to work on other operating systems.
