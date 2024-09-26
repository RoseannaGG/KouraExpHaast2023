###########################
### 02_trim_reads ############
############################


### test with one sample

cp ./Trimtest/AK01_R1.fastq.gz ./Trimtest/AK01_R2.fastq.gz Trimadapfolderplushead


cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimadapfolderplushead/

java -jar /usr/local/bin/trimmomatic.jar PE -threads 2 -trimlog /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimadapfolderplushead/trim_adapter_folder_otherfeatureshead_log.txt AK01_R1.fastq.gz AK01_R2.fastq.gz AK01_R1_PE.fastq.gz AK01_R1_SR.fastq.gz AK01_R2_PE.fastq.gz AK01_R2_SR.fastq.gz ILLUMINACLIP:/Volumes/archive/kennylab/LocalProgrammes/trimmomatic/Trimmomatic-0.39/adapters/NexteraPE-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:5:20 MINLEN:30 HEADCROP:1


# run fastqc on PE files

fastqc *.gz

## check fastqc reports


# check how many seq removed


$ zgrep -c '@' AK01_R1_PE.fastq.gz
6609174

roseannagamlen-greene@biochemcompute1 /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimadapfolderplushead
$ zgrep -c '@' AK01_R1.fastq.gz
18696458


# removed 35% of reads


########## okay looks good so do with all samples


cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/

mkdir Trimmed_reads
#

### Trim reads

screen

#!/bin/bash

# Directory containing raw reads
raw_reads_dir="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads"
# Directory for trimmed reads
trimmed_reads_dir="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads"
# Log file for trimming
log_file="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trim_log.txt"
# Path to Trimmomatic JAR
trimmomatic_jar="/usr/local/bin/trimmomatic.jar"
# Adapter file path
adapter_file="/Volumes/archive/kennylab/LocalProgrammes/trimmomatic/Trimmomatic-0.39/adapters/NexteraPE-PE.fa"

# Loop through all R1 files
for R1 in "${raw_reads_dir}"/*_R1.fastq.gz; do
  # Derive the corresponding R2 file
  R2="${R1%_R1.fastq.gz}_R2.fastq.gz"
  
  # Check if R2 file exists
  if [[ -f "$R2" ]]; then
    # Define output file paths
    output_R1_PE="${trimmed_reads_dir}/$(basename "${R1%.fastq.gz}")_R1_PE.fastq.gz"
    output_R1_SR="${trimmed_reads_dir}/$(basename "${R1%.fastq.gz}")_R1_SR.fastq.gz"
    output_R2_PE="${trimmed_reads_dir}/$(basename "${R2%.fastq.gz}")_R2_PE.fastq.gz"
    output_R2_SR="${trimmed_reads_dir}/$(basename "${R2%.fastq.gz}")_R2_SR.fastq.gz"

    # Run Trimmomatic with specified commands
    java -jar "$trimmomatic_jar" PE -threads 2 -trimlog "$log_file" \
      "$R1" "$R2" \
      "$output_R1_PE" "$output_R1_SR" \
      "$output_R2_PE" "$output_R2_SR" \
      ILLUMINACLIP:"$adapter_file":2:30:10 \
      LEADING:3 TRAILING:3 SLIDINGWINDOW:5:20 MINLEN:30 HEADCROP:1 >> "$log_file" 2>&1

    echo "Trimming completed for $R1 and $R2" >> "$log_file"
  else
    echo "Warning: R2 file not found for $R1" >> "$log_file"
  fi
done

screen -r 207773

## fastqc all PE

cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads

fastqc *PE.fastq.gz -o /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/fastqcPE