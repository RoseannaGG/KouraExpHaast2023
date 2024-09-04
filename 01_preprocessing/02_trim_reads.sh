############################
### 02_trim_reads ############
############################

cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/

mkdir Trimmed_reads3

### make fasta file with seq to remove - make sure line endings are "LF"



### Trim reads

screen

#!/bin/bash

# Directory containing raw reads
raw_reads_dir="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads"
# Directory for trimmed reads
trimmed_reads_dir="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3"
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
    HEADCROP:1 LEADING:3 SLIDINGWINDOW:5:20 MINLEN:50
  else
    echo "Warning: R2 file not found for $R1"
  fi
done

screen -r 17150







###




# just remove the nexteara


#### OLD
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


fastqc *.fastq.gz -o Trimmed_reads3/fastqc_trim/

# just PE

mkdir fastqcPE

screen
cp *PE* fastqcPE
screen -r 93390

mkdir R1_trim_PE_fastqc R2_trim_PE_fastqc


cp *R1* R1_trim_PE_fastqc
screen -r 84601

cp *R2* R2_trim_PE_fastqc
screen -r 90905

## fastqc
fastqc *

rm read_par

screen -r 231869


# multiqc the fastqc

mkdir multiqc

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
multiqc .




## download html files
scp cloudsigma@31.171.240.211:/home/cloudsigma/01_Read_Cleaning/Output_R1_paired_fastqc.html cloudsigma@31.171.240.211:/home/cloudsigma/01_Read_Cleaning/Output_R2_paired_fastqc.html /drives/c/Users/gamro07p/Documents/Transcriptomics/Tutorial_08_03_23/data/

scp cloudsigma@31.171.240.211:/home/cloudsigma/01_Read_Cleaning/Output_R1_paired_fastqc.html cloudsigma@31.171.240.211:/home/cloudsigma/01_Read_Cleaning/Output_R2_paired_fastqc.html /drives/c/Users/gamro07p/Documents/Transcriptomics/Tutorial_08_03_23/data/





######### test on one read ######
cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/AK01* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest_next/

cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/AK01* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trim_noadap/

cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/AK01* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trim_illadap/

cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/AK01* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest2/

cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/AK01* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestori/

cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/AK01* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestlead/

cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/AK01* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest3/

cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/AK01* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest4/

cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/AK01* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest5/

cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/AK01* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/TrimtestADAPONLY/

cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/AK01* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest6/

# TEST works on single read

screen

#  LEADING:2 SLIDINGWINDOW:5:20
cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest2/
java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest2/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest2/seqtoremove_adap2.txt:2:30:10 LEADING:2 TRAILING:3 SLIDINGWINDOW:5:20 MINLEN:30 
screen -r 145421

"$ java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest2/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest2/seqtoremove_adap2.txt:2:30:10 LEADING:2 TRAILING:3 SLIDINGWINDOW:5:20 MINLEN:30
TrimmomaticPE: Started with arguments: -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest2/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest2/seqtoremove_adap2.txt:2:30:10 LEADING:2 TRAILING:3 SLIDINGWINDOW:5:20 MINLEN:30
Using Long Clipping Sequence: 'GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG'
Using Long Clipping Sequence: 'TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG'
Using Short Clipping Sequence: 'GTCTCGTGGGCTCGG'
Using Short Clipping Sequence: 'TCGTCGGCAGCGTC'
ILLUMINACLIP: Using 0 prefix pairs, 4 forward/reverse sequences, 0 forward only sequences, 0 reverse only sequences
Quality encoding detected as phred33
Input Read Pairs: 18696458 Both Surviving: 16762058 (89.65%) Forward Only Surviving: 1352389 (7.23%) Reverse Only Surviving: 300015 (1.60%) Dropped: 281996 (1.51%)
TrimmomaticPE: Completed successfully
"


# LEADING:2
cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestlead/
java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestlead/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestlead/seqtoremove_adap2.txt:2:30:10 LEADING:2 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30 
screen -r 174003

"
$ java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestlead/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestlead/seqtoremove_adap2.txt:2:30:10 LEADING:2 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30
TrimmomaticPE: Started with arguments: -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestlead/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestlead/seqtoremove_adap2.txt:2:30:10 LEADING:2 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30
Using Long Clipping Sequence: 'GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG'
Using Long Clipping Sequence: 'TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG'
Using Short Clipping Sequence: 'GTCTCGTGGGCTCGG'
Using Short Clipping Sequence: 'TCGTCGGCAGCGTC'
ILLUMINACLIP: Using 0 prefix pairs, 4 forward/reverse sequences, 0 forward only sequences, 0 reverse only sequences
Quality encoding detected as phred33
Input Read Pairs: 18696458 Both Surviving: 651498 (3.48%) Forward Only Surviving: 2743978 (14.68%) Reverse Only Surviving: 1873687 (10.02%) Dropped: 13427295 (71.82%)
TrimmomaticPE: Completed successfully
"

# default original
cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestori/
java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestori/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestori/seqtoremove_adap2.txt:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30 
screen -r 180884

"$ java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestori/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestori/seqtoremove_adap2.txt:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30
TrimmomaticPE: Started with arguments: -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestori/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtestori/seqtoremove_adap2.txt:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30
Using Long Clipping Sequence: 'GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG'
Using Long Clipping Sequence: 'TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG'
Using Short Clipping Sequence: 'GTCTCGTGGGCTCGG'
Using Short Clipping Sequence: 'TCGTCGGCAGCGTC'
ILLUMINACLIP: Using 0 prefix pairs, 4 forward/reverse sequences, 0 forward only sequences, 0 reverse only sequences
Quality encoding detected as phred33
Input Read Pairs: 18696458 Both Surviving: 651498 (3.48%) Forward Only Surviving: 2743978 (14.68%) Reverse Only Surviving: 1873687 (10.02%) Dropped: 13427295 (71.82%)
TrimmomaticPE: Completed successfully
"

# new trial LEADING:3 SLIDINGWINDOW:5:20 MINLEN:50
cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest3/
java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest3/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest3/seqtoremove_adap2.txt:2:30:10 LEADING:3 SLIDINGWINDOW:5:20 MINLEN:50
screen -r 218988

"$ java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest3/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest3/seqtoremove_adap2.txt:2:30:10 LEADING:3 SLIDINGWINDOW:5:20 MINLEN:50
TrimmomaticPE: Started with arguments: -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest3/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest3/seqtoremove_adap2.txt:2:30:10 LEADING:3 SLIDINGWINDOW:5:20 MINLEN:50
Using Long Clipping Sequence: 'GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG'
Using Long Clipping Sequence: 'TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG'
Using Short Clipping Sequence: 'GTCTCGTGGGCTCGG'
Using Short Clipping Sequence: 'TCGTCGGCAGCGTC'
ILLUMINACLIP: Using 0 prefix pairs, 4 forward/reverse sequences, 0 forward only sequences, 0 reverse only sequences
Quality encoding detected as phred33
Input Read Pairs: 18696458 Both Surviving: 16195617 (86.62%) Forward Only Surviving: 1575263 (8.43%) Reverse Only Surviving: 390163 (2.09%) Dropped: 535415 (2.86%)
TrimmomaticPE: Completed successfully
"


# new trial SLIDINGWINDOW:5:20 
cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest5/
java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest5/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest4/seqtoremove_adap2.txt:2:30:10 LEADING:3 SLIDINGWINDOW:5:20 MINLEN:30
screen -r 96064



# ADAPONLY
cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/TrimtestADAPONLY/
java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/TrimtestADAPONLY/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/TrimtestADAPONLY/seqtoremove_adap2.txt:2:30:10 
screen -r 105988


# new trial HEADCROP:1 LEADING:3 SLIDINGWINDOW:5:20 MINLEN:50
cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest6/
java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest6/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest6/seqtoremove_adap2.txt:2:30:10 HEADCROP:1 LEADING:3 SLIDINGWINDOW:5:20 MINLEN:50
screen -r 309350


"
$ java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest6/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest6/seqtoremove_adap2.txt:2:30:10 HEADCROP:1 LEADING:3 SLIDINGWINDOW:5:20 MINLEN:50
TrimmomaticPE: Started with arguments: -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest6/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest6/seqtoremove_adap2.txt:2:30:10 HEADCROP:1 LEADING:3 SLIDINGWINDOW:5:20 MINLEN:50
Using Long Clipping Sequence: 'GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG'
Using Long Clipping Sequence: 'TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG'
Using Short Clipping Sequence: 'GTCTCGTGGGCTCGG'
Using Short Clipping Sequence: 'TCGTCGGCAGCGTC'
ILLUMINACLIP: Using 0 prefix pairs, 4 forward/reverse sequences, 0 forward only sequences, 0 reverse only sequences
Quality encoding detected as phred33
Input Read Pairs: 18696458 Both Surviving: 16324846 (87.32%) Forward Only Surviving: 1526843 (8.17%) Reverse Only Surviving: 340652 (1.82%) Dropped: 504117 (2.70%)
TrimmomaticPE: Completed successfully
"

# new trial HEADCROP:1 SLIDINGWINDOW:5:20 MINLEN:30
cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest4/
java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest4/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest4/seqtoremove_adap2.txt:2:30:10 HEADCROP:1 SLIDINGWINDOW:5:20 MINLEN:30
screen -r 298900

"
$ java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest4/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest4/seqtoremove_adap2.txt:2:30:10 HEADCROP:1 SLIDINGWINDOW:5:20 MINLEN:30
TrimmomaticPE: Started with arguments: -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest4/trim_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest4/seqtoremove_adap2.txt:2:30:10 HEADCROP:1 SLIDINGWINDOW:5:20 MINLEN:30
Using Long Clipping Sequence: 'GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG'
Using Long Clipping Sequence: 'TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG'
Using Short Clipping Sequence: 'GTCTCGTGGGCTCGG'
Using Short Clipping Sequence: 'TCGTCGGCAGCGTC'
ILLUMINACLIP: Using 0 prefix pairs, 4 forward/reverse sequences, 0 forward only sequences, 0 reverse only sequences
Quality encoding detected as phred33
Input Read Pairs: 18696458 Both Surviving: 16916767 (90.48%) Forward Only Surviving: 1286561 (6.88%) Reverse Only Surviving: 240003 (1.28%) Dropped: 253127 (1.35%)
TrimmomaticPE: Completed successfully
"


# next only
cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest_next/
java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest_next/trim_next_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest_next/seqtoremovenext.txt:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30 
screen -r 39744

"
$ java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest_next/trim_next_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest_next/seqtoremovenext.txt:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30
TrimmomaticPE: Started with arguments: -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest_next/trim_next_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest_next/seqtoremovenext.txt:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30
Using Long Clipping Sequence: 'GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG'
Using Long Clipping Sequence: 'TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG'
ILLUMINACLIP: Using 0 prefix pairs, 2 forward/reverse sequences, 0 forward only sequences, 0 reverse only sequences
Quality encoding detected as phred33
Input Read Pairs: 18696458 Both Surviving: 651498 (3.48%) Forward Only Surviving: 2743978 (14.68%) Reverse Only Surviving: 1873687 (10.02%) Dropped: 13427295 (71.82%)
TrimmomaticPE: Completed successfully
"


# no adapt
java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trim_noadap/trim_noadap_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30 
screen -r 51351

"$ java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trim_noadap/trim_noadap_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30
TrimmomaticPE: Started with arguments: -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trim_noadap/trim_noadap_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30
Quality encoding detected as phred33
Input Read Pairs: 18696458 Both Surviving: 651498 (3.48%) Forward Only Surviving: 2743978 (14.68%) Reverse Only Surviving: 1873687 (10.02%) Dropped: 13427295 (71.82%)
TrimmomaticPE: Completed successfully
"


# illumina adap
java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trim_illadap/trim_next_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trim_illadap/seqremoveillumina2.txt:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30 
screen -r 59020

"
$ java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trim_illadap/trim_next_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trim_illadap/seqremoveillumina2.txt:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30
TrimmomaticPE: Started with arguments: -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trim_illadap/trim_next_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trim_illadap/seqremoveillumina2.txt:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30
Using Short Clipping Sequence: 'GTCTCGTGGGCTCGG'
Using Short Clipping Sequence: 'TCGTCGGCAGCGTC'
ILLUMINACLIP: Using 0 prefix pairs, 2 forward/reverse sequences, 0 forward only sequences, 0 reverse only sequences
Quality encoding detected as phred33
Input Read Pairs: 18696458 Both Surviving: 651498 (3.48%) Forward Only Surviving: 2743978 (14.68%) Reverse Only Surviving: 1873687 (10.02%) Dropped: 13427295 (71.82%)
TrimmomaticPE: Completed successfully
"

### next and no other settings


## lower 



java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest/trim_none_log.txt -basein  AK01_R1.fastq.gz AK01_R2.fastq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:30 




## cutadapt

cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest

# https://cutadapt.readthedocs.io/en/stable/guide.html

screen

cutadapt -a GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG -o AK01_R1_nextR2.fastq.gz AK01_R1.fastq.gz



cutadapt -a GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG AK01_R1.fastq.gz > AK01_R1_nextR2.fastq.gz 2> AK01_R1_nextR2_report.txt
screen -r 413209


cutadapt -a TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG AK01_R1.fastq.gz > AK01_R1_nextR1.fastq.gz 2> AK01_R1_nextR1_report.txt
screen -r 431411

cutadapt -a TCGTCGGCAGCGTC AK01_R1.fastq.gz > AK01_R1_i5.fastq.gz 2> AK01_R1_i5_report.txt
screen -r 434507

cutadapt -a GTCTCGTGGGCTCGG AK01_R1.fastq.gz > AK01_R1_i7.fastq.gz 2> AK01_R1_i7_report.txt
screen -r 436837





cutadapt -a GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG AK01_R2.fastq.gz > AK01_R2_nextR2.fastq.gz 2> AK01_R2_nextR2_report.txt



cutadapt -a TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG AK01_R2.fastq.gz > AK01_R2_nextR1.fastq.gz 2> AK01_R2_nextR1_report.txt


cutadapt -a TCGTCGGCAGCGTC AK01_R2.fastq.gz > AK01_R2_i5.fastq.gz 2> AK01_R2_i5_report.txt


cutadapt -a GTCTCGTGGGCTCGG AK01_R2.fastq.gz > AK01_R2_i7.fastq.gz 2> AK01_R2_i7_report.txt


screen
cutadapt -a TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG -A GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG -o AK01_R1_nextcut2.fastq.gz -p AK01_R2_nextcut2.fastq.gz AK01_R1.fastq.gz AK01_R2.fastq.gz
screen -r 202593

"
No. of allowed errors:
0-9 bp: 0; 10-19 bp: 1; 20-29 bp: 2; 30-34 bp: 3

Bases preceding removed adapters:
  A: 4.6%
  C: 2.2%
  G: 20.0%
  T: 73.1%
  none/other: 0.0%

Overview of removed sequences
length  count   expect  max.err error counts
3       322219  292132.2        0       322219
4       161829  73033.0 0       161829
5       146649  18258.3 0       146649
6       1338    4564.6  0       1338
7       1137    1141.1  0       1137
8       985     285.3   0       985
9       118     71.3    0       12 106
10      157     17.8    1       6 151
11      32      4.5     1       0 32
12      4       1.1     1       0 4
13      1       0.3     1       0 1
20      3       0.0     2       0 0 3
29      2       0.0     2       0 0 2
32      1       0.0     3       0 0 1
35      1       0.0     3       0 0 0 1
43      1       0.0     3       0 0 1
52      2       0.0     3       0 0 2
151     9       0.0     3       0 1 1 7
"

# trim i5 and i7

cutadapt -a GTCTCGTGGGCTCGG -A TCGTCGGCAGCGTC -o AK01_R1_nextcut_adap2.fastq.gz -p AK01_R2_nextcut_adap2.fastq.gz AK01_R1_nextcu.fastq.gz AK01_R2_nextcut.fastq.gz 2> AK01_nextcut_adap2_report.txt

 "
74      2       0.1     1       0 2
78      1       0.1     1       0 1
80      1       0.1     1       0 1
84      1       0.1     1       0 1
89      1       0.1     1       0 1
94      1       0.1     1       0 1
96      1       0.1     1       0 1
99      2       0.1     1       0 2
106     1       0.1     1       0 1
115     1       0.1     1       0 1
117     1       0.1     1       0 1
118     1       0.1     1       0 1
122     1       0.1     1       0 1
126     3       0.1     1       0 3
129     1       0.1     1       0 1
130     1       0.1     1       0 1
133     1       0.1     1       0 1
137     3       0.1     1       0 3
138     1       0.1     1       0 1
140     2       0.1     1       0 2
141     1       0.1     1       0 1
142     1       0.1     1       0 1
147     1       0.1     1       0 1
149     1       0.1     1       0 1
151     1       0.1     1       0 1


WARNING:
    One or more of your adapter sequences may be incomplete.
    Please see the detailed output above.
"


"cutadapt -a GTCTCGTGGGCTCGG -A TCGTCGGCAGCGTC -o AK01_R1_nextcut_adap2.fastq.gz -p AK01_R2_nextcut_adap2.fastq.gz AK01_R1_nextcu.fastq.gz AK01_R2_nextcut.fastq.gz 2> AK01_nextcut_adap2_report.txt
This is cutadapt 2.7 with Python 3.6.8
Command line parameters: -a GTCTCGTGGGCTCGG -A TCGTCGGCAGCGTC -o AK01_R1_nextcut_adap2.fastq.gz -p AK01_R2_nextcut_adap2.fastq.gz AK01_R1_nextcu.fastq.gz AK01_R2_nextcut.fastq.gz
Processing reads on 1 core in paired-end mode ...
Finished in 2232.93 s (119 us/read; 0.50 M reads/minute).

=== Summary ===

Total read pairs processed:         18,696,458
  Read 1 with adapter:                 570,037 (3.0%)
  Read 2 with adapter:                 306,865 (1.6%)
Pairs written (passing filters):    18,696,458 (100.0%)

Total basepairs processed: 5,643,166,474 bp
  Read 1: 2,822,377,137 bp
  Read 2: 2,820,789,337 bp
Total written (filtered):  5,640,017,088 bp (99.9%)
  Read 1: 2,820,170,511 bp
  Read 2: 2,819,846,577 bp

=== First read: Adapter 1 ===

Sequence: GTCTCGTGGGCTCGG; Type: regular 3'; Length: 15; Trimmed: 570037 times.

No. of allowed errors:
0-9 bp: 0; 10-15 bp: 1

Bases preceding removed adapters:
  A: 6.1%
  C: 3.0%
  G: 7.9%
  T: 82.9%
  none/other: 0.0%
WARNING:
    The adapter is preceded by "T" extremely often.
    The provided adapter sequence could be incomplete at its 3' end.

Overview of removed sequences
length  count   expect  max.err error counts
3       240219  292132.2        0       240219
4       177377  73033.0 0       177377
5       149126  18258.3 0       149126
6       14      4564.6  0       14
7       18      1141.1  0       18
8       811     285.3   0       811
9       1028    71.3    0       425 603
10      1219    17.8    1       22 1197
11      203     4.5     1       1 202
12      11      1.1     1       0 11
13      5       0.3     1       0 5
23      1       0.0     1       0 1
26      1       0.0     1       0 1
28      1       0.0     1       0 1
39      1       0.0     1       0 1
66      1       0.0     1       0 1
79      1       0.0     1       0 1


=== Second read: Adapter 2 ===

Sequence: TCGTCGGCAGCGTC; Type: regular 3'; Length: 14; Trimmed: 306865 times.

No. of allowed errors:
0-9 bp: 0; 10-14 bp: 1

Bases preceding removed adapters:
  A: 5.4%
  C: 52.1%
  G: 38.3%
  T: 4.2%
  none/other: 0.0%

Overview of removed sequences
length  count   expect  max.err error counts
3       291423  292132.2        0       291423
4       14369   73033.0 0       14369
5       65      18258.3 0       65
6       699     4564.6  0       699
7       74      1141.1  0       74
8       19      285.3   0       19
9       105     71.3    0       4 101
10      50      17.8    1       2 48
11      17      4.5     1       0 17
12      3       1.1     1       0 3
20      1       0.1     1       0 1
21      1       0.1     1       0 1
25      1       0.1     1       0 1
29      1       0.1     1       0 1
43      1       0.1     1       0 1
59      2       0.1     1       0 2
64      2       0.1     1       0 2
74      2       0.1     1       0 2
78      1       0.1     1       0 1
80      1       0.1     1       0 1
84      1       0.1     1       0 1
89      1       0.1     1       0 1
94      1       0.1     1       0 1
96      1       0.1     1       0 1
99      2       0.1     1       0 2
106     1       0.1     1       0 1
115     1       0.1     1       0 1
117     1       0.1     1       0 1
118     1       0.1     1       0 1
122     1       0.1     1       0 1
126     3       0.1     1       0 3
129     1       0.1     1       0 1
130     1       0.1     1       0 1
133     1       0.1     1       0 1
137     3       0.1     1       0 3
138     1       0.1     1       0 1
140     2       0.1     1       0 2
141     1       0.1     1       0 1
142     1       0.1     1       0 1
147     1       0.1     1       0 1
149     1       0.1     1       0 1
151     1       0.1     1       0 1


WARNING:
    One or more of your adapter sequences may be incomplete.
    Please see the detailed output above.
"



## nathan try reverse

cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimtest

# The nextera transposase seq hasn’t been trimmed from any reads, by the look of it – your fastqc outputs are identical. Try the reverse complements:



cutadapt -a CTGTCTCTTATACACATCTGACGCTGCCGACGA -A CTGTCTCTTATACACATCTCCGAGCCCACGAGAC -o AK01_R1_nextcutrevcomp.fastq.gz -p AK01_R2_nextcutrevcomp.fastq.gz AK01_R1.fastq.gz AK01_R2.fastq.gz

screen -r 377606


"$ screen -r 377606
12      169031  1.1     1       160662 8369
13      172259  0.3     1       161416 10843
14      172706  0.1     1       161928 10778
15      174205  0.0     1       162502 11703
16      174516  0.0     1       162688 11828
17      170162  0.0     1       156442 13720
18      168324  0.0     1       155201 12804 319
19      171145  0.0     1       156605 13436 1104
20      173196  0.0     2       3778 1831 167587
21      166732  0.0     2       27 1610 165095
22      175801  0.0     2       0 981 174820
23      182144  0.0     2       0 844 181300
24      1768    0.0     2       0 9 1759
25      38      0.0     2       0 0 38
26      26      0.0     2       0 0 26
27      28      0.0     2       0 0 28
28      36      0.0     2       0 0 36
29      2       0.0     2       0 0 1 1
30      1       0.0     3       0 0 1
31      2       0.0     3       0 0 0 2
32      32      0.0     3       0 0 0 32
33      42      0.0     3       0 0 1 41
35      1       0.0     3       0 0 0 1
47      1       0.0     3       0 0 0 1
75      1       0.0     3       0 0 0 1


WARNING:
    One or more of your adapter sequences may be incomplete.
    Please see the detailed output above.
"

# shorter

cutadapt -a CTGTCTCTTATACACATCT -A CTGTCTCTTATACACAT -o AK01_R1_nextcutrevcompshort.fastq.gz -p AK01_R2_nextcutrevcompshort.fastq.gz AK01_R1.fastq.gz AK01_R2.fastq.gz

screen -r 23037

# fastqc trimmed outputs

screen -r 149150

##### UP TO HERE - SEPT 3RD 2024