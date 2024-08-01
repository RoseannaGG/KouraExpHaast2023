############################
### 03_assembly ############
############################


cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/


/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity -h



#test - works
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity --seqType fq --max_memory 512G --left AK01_R1_PE.fastq.gz,AK02_R1_PE.fastq.gz --right AK01_R2_PE.fastq.gz,AK02_R2_PE.fastq.gz --CPU 32 --min_contig_length 200 --normalize_max_read_cov 50 --full_cleanup --verbose --output trinity


## do for real

screen

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity --seqType fq --max_memory 512G --left AK01_R1_PE.fastq.gz,AK02_R1_PE.fastq.gz,AK03_R1_PE.fastq.gz,AK04_R1_PE.fastq.gz,AK05_R1_PE.fastq.gz,AK06_R1_PE.fastq.gz,AK07_R1_PE.fastq.gz,AK08_R1_PE.fastq.gz,AK09_R1_PE.fastq.gz,HK01_R1_PE.fastq.gz,HK02_R1_PE.fastq.gz,AK10_R1_PE.fastq.gz,AK11_R1_PE.fastq.gz,AK12_R1_PE.fastq.gz,AK13_R1_PE.fastq.gz,AK14_R1_PE.fastq.gz,AK15_R1_PE.fastq.gz,AK16_R1_PE.fastq.gz,HK03_R1_PE.fastq.gz,AK17_R1_PE.fastq.gz,MK01_R1_PE.fastq.gz,MK02_R1_PE.fastq.gz,MK03_R1_PE.fastq.gz,MK04_R1_PE.fastq.gz,MK05_R1_PE.fastq.gz,MK06_R1_PE.fastq.gz,MK07_R1_PE.fastq.gz,MK08_R1_PE.fastq.gz,MK09_R1_PE.fastq.gz,HK04_R1_PE.fastq.gz,HK05_R1_PE.fastq.gz,HK06_R1_PE.fastq.gz,HK07_R1_PE.fastq.gz,HK08_R1_PE.fastq.gz,HK09_R1_PE.fastq.gz,HK10_R1_PE.fastq.gz,HK11_R1_PE.fastq.gz,HK12_R1_PE.fastq.gz,HK13_R1_PE.fastq.gz,HK14_R1_PE.fastq.gz,HK15_R1_PE.fastq.gz,HK16_R1_PE.fastq.gz,HK17_R1_PE.fastq.gz,HK18_R1_PE.fastq.gz,HK19_R1_PE.fastq.gz --right AK01_R2_PE.fastq.gz,AK02_R2_PE.fastq.gz,AK03_R2_PE.fastq.gz,AK04_R2_PE.fastq.gz,AK05_R2_PE.fastq.gz,AK06_R2_PE.fastq.gz,AK07_R2_PE.fastq.gz,AK08_R2_PE.fastq.gz,AK09_R2_PE.fastq.gz,HK01_R2_PE.fastq.gz,HK02_R2_PE.fastq.gz,AK10_R2_PE.fastq.gz,AK11_R2_PE.fastq.gz,AK12_R2_PE.fastq.gz,AK13_R2_PE.fastq.gz,AK14_R2_PE.fastq.gz,AK15_R2_PE.fastq.gz,AK16_R2_PE.fastq.gz,HK03_R2_PE.fastq.gz,AK17_R2_PE.fastq.gz,MK01_R2_PE.fastq.gz,MK02_R2_PE.fastq.gz,MK03_R2_PE.fastq.gz,MK04_R2_PE.fastq.gz,MK05_R2_PE.fastq.gz,MK06_R2_PE.fastq.gz,MK07_R2_PE.fastq.gz,MK08_R2_PE.fastq.gz,MK09_R2_PE.fastq.gz,HK04_R2_PE.fastq.gz,HK05_R2_PE.fastq.gz,HK06_R2_PE.fastq.gz,HK07_R2_PE.fastq.gz,HK08_R2_PE.fastq.gz,HK09_R2_PE.fastq.gz,HK10_R2_PE.fastq.gz,HK11_R2_PE.fastq.gz,HK12_R2_PE.fastq.gz,HK13_R2_PE.fastq.gz,HK14_R2_PE.fastq.gz,HK15_R2_PE.fastq.gz,HK16_R2_PE.fastq.gz,HK17_R2_PE.fastq.gz,HK18_R2_PE.fastq.gz,HK19_R2_PE.fastq.gz --CPU 32 --min_contig_length 200 --normalize_max_read_cov 50 --full_cleanup --verbose --SS_lib_type RF --output trinity

Crtl +A+D #to exit

#to reattach
screen -r 197038

"


"

## move outputs to assembly folder

mv trinity.Trinity.fasta* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/assembly

## delete extra trinity files

rm -r trinity



####################
### statistics ######
#############
# quality of transcriptome

mkdir assembly_assessment

# copy fasta
cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/assembly/trinity.Trinity.fasta /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/assembly/assembly_assessment/

perl /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/TrinityStats.pl /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/assembly/assembly_assessment/trinity.Trinity.fasta

""

