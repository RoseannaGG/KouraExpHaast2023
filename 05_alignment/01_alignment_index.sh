############################
### 06_alignment ############ should only take 30min or so
############################

cd ~/Trimmed_reads_adap
mkdir R1_trimmed_PE R2_trimmed_PE

screen
cp *R1_PE.fastq.gz R1_trimmed_PE/

screen -r 

screen
cp *R2_PE.fastq.gz R2_trimmed_PE/
screen -r 




## loop
screen
GENOME_DIR="/Volumes/archive/kennylab/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/bowtie_index/genome/"
THREADS=16
OUTPUT_DIR="/Volumes/archive/kennylab/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/bowtie_index/alignment/"  


# List of sample names
sample_names=("AK01" "AK02" "AK03" "AK04" "AK05" "AK06" "AK07" "AK08" "AK09" "AK10" "AK11" "AK12" "AK13" "AK14" "AK15" "AK16" "AK17" "HK01" "HK02" "HK03" "HK04" "HK05" "HK06" "HK07" "HK08" "HK09" "HK10" "HK11" "HK12" "HK13" "HK14" "HK15" "HK16" "HK17" "HK18" "HK19" "MK01" "MK02" "MK03" "MK04" "MK05" "MK06" "MK07" "MK08" "MK09") 

# Loop through the sample names
for sample_name in "${sample_names[@]}"; do
    # Construct the paths to the forward and reverse read files for the sample
    read1="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/R1_trimmed_PE/${sample_name}_R1_PE.fastq.gz"
    read2="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/R2_trimmed_PE/${sample_name}_R2_PE.fastq.gz"

    # Run STAR for alignment
    STAR \
        --genomeDir "$GENOME_DIR" \
        --runThreadN "$THREADS" \
        --readFilesIn "$read1" "$read2" \
        --readFilesCommand zcat \
        --outFileNamePrefix "$OUTPUT_DIR/${sample_name}_"

    echo "Alignment for $sample_name is complete."
done

echo "All alignments are finished."


screen -r 

"
"





##### cinvert sam to bam

for file in *.sam; do

    samtools view -S -b $file > "`basename $file .sam`.bam"

done

# Specify input and output directories
mkdir bamfiles

screen

input_dir="/Volumes/archive/kennylab/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/bowtie_index/alignment/"
output_dir="/Volumes/archive/kennylab/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/bowtie_index/alignment/bamfiles/"

# Ensure the output directory exists
mkdir -p "$output_dir"

# Loop through SAM files in the input directory
for sam_file in "${input_dir}"/*.sam; do
    # Check if the file is a regular file
    if [ -f "$sam_file" ]; then
        # Create the corresponding BAM file in the output directory
        bam_file="${output_dir}/$(basename "${sam_file}" .sam).bam"

        # Convert SAM to BAM using Samtools
        samtools view -S -b "$sam_file" > "$bam_file"

        echo "Converted ${sam_file} to ${bam_file}"
    fi
done


screen -r 

## sort bam for snp calling

screen

input_dir="/Volumes/archive/kennylab/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/bowtie_index/alignment/bamfiles/"
output_dir="/Volumes/archive/kennylab/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/bowtie_index/alignment/bamfiles/sorted_bamfiles/"

# Ensure the output directory exists
mkdir -p "$output_dir"

# Loop through all BAM files in the input directory
for bam_file in "${input_dir}"/*.bam; do
    # Extract the base name of the BAM file (excluding the path and extension)
    base_name=$(basename "${bam_file%.out.bam}")

    # Construct the output sorted BAM file path
    output_sorted_bam="$output_dir/${base_name}-sorted.bam"

    # Use samtools to sort the BAM file
    samtools sort "$bam_file" -o "$output_sorted_bam"

    echo "Sorted ${bam_file} -> ${output_sorted_bam}"
done


screen -r 



## index genome again

cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/annotation_evigene

screen

samtools faidx trinity_Trinity_okaytr.fasta

# output is called  trinity_Trinity_okaytr.fasta.fai

