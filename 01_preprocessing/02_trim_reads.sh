############################
### 02_trim_reads ############
############################

cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/

mkdir Trimmed_reads3

### make fasta file with seq to remove - make sure line endings are "LF"



### Trim reads



# just remove the nexteara

screen

for R1 in *_R1.fastq.gz ; do

  R2="${R1%_R1.fastq.gz}_R2.fastq.gz"

  java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trimmed_log6.txt "/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/$R1" "/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/$R2" "/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/${R1%.fastq.gz}_PE.fastq.gz" "/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/${R1%.fastq.gz}_SR.fastq.gz" "/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/${R2%.fastq.gz}_PE.fastq.gz" "/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/${R2%.fastq.gz}_SR.fastq.gz" ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/seqtoremove.txt:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30 

done

screen -r 233601


# remove adapters as well

screen

#!/bin/bash

# Directory containing raw reads
raw_reads_dir="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads"
# Directory for trimmed reads
trimmed_reads_dir="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap"
# Path to Trimmomatic JAR
trimmomatic_jar="/usr/local/bin/trimmomatic.jar"
# Path to the adapter sequence file
adapter_file="${trimmed_reads_dir}/seqtoremove_adap2.txt"
# Log file for trimming
log_file="${trimmed_reads_dir}/trimmed_log.txt"

# Loop through all R1 files
for R1 in "${raw_reads_dir}"/*_R1.fastq.gz; do
  # Derive the corresponding R2 file
  R2="${R1%_R1.fastq.gz}_R2.fastq.gz"
  
  # Check if R2 file exists
  if [[ -f "$R2" ]]; then
    # Define output file paths
    output_R1_PE="${trimmed_reads_dir}/$(basename "${R1%.fastq.gz}_PE.fastq.gz")"
    output_R1_SR="${trimmed_reads_dir}/$(basename "${R1%.fastq.gz}_SR.fastq.gz")"
    output_R2_PE="${trimmed_reads_dir}/$(basename "${R2%.fastq.gz}_PE.fastq.gz")"
    output_R2_SR="${trimmed_reads_dir}/$(basename "${R2%.fastq.gz}_SR.fastq.gz")"

    # Run Trimmomatic
    java -jar "$trimmomatic_jar" PE -threads 2 -trimlog "$log_file" \
    "$R1" "$R2" \
    "$output_R1_PE" "$output_R1_SR" \
    "$output_R2_PE" "$output_R2_SR" \
    ILLUMINACLIP:"$adapter_file":2:30:10 \
    LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30
  else
    echo "Warning: R2 file not found for $R1"
  fi
done

screen -r 41177


"ILLUMINACLIP: Using 0 prefix pairs, 4 forward/reverse sequences, 0 forward only sequences, 0 reverse only sequences
Quality encoding detected as phred33
Input Read Pairs: 4949868 Both Surviving: 184222 (3.72%) Forward Only Surviving: 701442 (14.17%) Reverse Only Surviving: 539662 (10.90%) Dropped: 3524542 (71.20%)
TrimmomaticPE: Completed successfully
TrimmomaticPE: Started with arguments: -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trimmed_log.txt /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/MK09_R1.fastq.gz /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/MK09_R2.fastq.gz /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/MK09_R1_PE.fastq.gz /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/MK09_R1_SR.fastq.gz /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/MK09_R2_PE.fastq.gz /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/MK09_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/seqtoremove_adap2.txt:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30
Using Long Clipping Sequence: 'GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG'
Using Long Clipping Sequence: 'TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG'
Using Short Clipping Sequence: 'GTCTCGTGGGCTCGG'
Using Short Clipping Sequence: 'TCGTCGGCAGCGTC'
ILLUMINACLIP: Using 0 prefix pairs, 4 forward/reverse sequences, 0 forward only sequences, 0 reverse only sequences
Quality encoding detected as phred33
Input Read Pairs: 19640620 Both Surviving: 654730 (3.33%) Forward Only Surviving: 2815325 (14.33%) Reverse Only Surviving: 1924194 (9.80%) Dropped: 14246371 (72.54%)
TrimmomaticPE: Completed successfully

"

# fastqc trimmed reads
mkdir fastqc_trim

screen


fastqc *.fastq.gz -o /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/fastqc_trim/

# just PE

mkdir fastqcPE

cp *PE* fastqcPE


mkdir R1_trim_PE_fastqc R2_trim_PE_fastqc


cp *R1* R1_trim_PE_fastqc

cp *R2* R2_trim_PE_fastqc


# multiqc the fastqc

mkdir multiqc

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
multiqc .

## download html files
scp cloudsigma@31.171.240.211:/home/cloudsigma/01_Read_Cleaning/Output_R1_paired_fastqc.html cloudsigma@31.171.240.211:/home/cloudsigma/01_Read_Cleaning/Output_R2_paired_fastqc.html /drives/c/Users/gamro07p/Documents/Transcriptomics/Tutorial_08_03_23/data/





######### test on one read ######