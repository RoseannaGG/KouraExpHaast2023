############################
### 03_trinity ############
############################


cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/


/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity -h


## 32 cpu okay on biochemcompute3 but not others
#test - works
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity --seqType fq --max_memory 512G --left AK01_R1_PE.fastq.gz,AK02_R1_PE.fastq.gz --right AK01_R2_PE.fastq.gz,AK02_R2_PE.fastq.gz --CPU 32 --min_contig_length 200 --normalize_max_read_cov 50 --full_cleanup --verbose --output trinity


## do for real

screen

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity --seqType fq --max_memory 512G --left AK01_R1_PE.fastq.gz,AK02_R1_PE.fastq.gz,AK03_R1_PE.fastq.gz,AK04_R1_PE.fastq.gz,AK05_R1_PE.fastq.gz,AK06_R1_PE.fastq.gz,AK07_R1_PE.fastq.gz,AK08_R1_PE.fastq.gz,AK09_R1_PE.fastq.gz,HK01_R1_PE.fastq.gz,HK02_R1_PE.fastq.gz,AK10_R1_PE.fastq.gz,AK11_R1_PE.fastq.gz,AK12_R1_PE.fastq.gz,AK13_R1_PE.fastq.gz,AK14_R1_PE.fastq.gz,AK15_R1_PE.fastq.gz,AK16_R1_PE.fastq.gz,HK03_R1_PE.fastq.gz,AK17_R1_PE.fastq.gz,MK01_R1_PE.fastq.gz,MK02_R1_PE.fastq.gz,MK03_R1_PE.fastq.gz,MK04_R1_PE.fastq.gz,MK05_R1_PE.fastq.gz,MK06_R1_PE.fastq.gz,MK07_R1_PE.fastq.gz,MK08_R1_PE.fastq.gz,MK09_R1_PE.fastq.gz,HK04_R1_PE.fastq.gz,HK05_R1_PE.fastq.gz,HK06_R1_PE.fastq.gz,HK07_R1_PE.fastq.gz,HK08_R1_PE.fastq.gz,HK09_R1_PE.fastq.gz,HK10_R1_PE.fastq.gz,HK11_R1_PE.fastq.gz,HK12_R1_PE.fastq.gz,HK13_R1_PE.fastq.gz,HK14_R1_PE.fastq.gz,HK15_R1_PE.fastq.gz,HK16_R1_PE.fastq.gz,HK17_R1_PE.fastq.gz,HK18_R1_PE.fastq.gz,HK19_R1_PE.fastq.gz --right AK01_R2_PE.fastq.gz,AK02_R2_PE.fastq.gz,AK03_R2_PE.fastq.gz,AK04_R2_PE.fastq.gz,AK05_R2_PE.fastq.gz,AK06_R2_PE.fastq.gz,AK07_R2_PE.fastq.gz,AK08_R2_PE.fastq.gz,AK09_R2_PE.fastq.gz,HK01_R2_PE.fastq.gz,HK02_R2_PE.fastq.gz,AK10_R2_PE.fastq.gz,AK11_R2_PE.fastq.gz,AK12_R2_PE.fastq.gz,AK13_R2_PE.fastq.gz,AK14_R2_PE.fastq.gz,AK15_R2_PE.fastq.gz,AK16_R2_PE.fastq.gz,HK03_R2_PE.fastq.gz,AK17_R2_PE.fastq.gz,MK01_R2_PE.fastq.gz,MK02_R2_PE.fastq.gz,MK03_R2_PE.fastq.gz,MK04_R2_PE.fastq.gz,MK05_R2_PE.fastq.gz,MK06_R2_PE.fastq.gz,MK07_R2_PE.fastq.gz,MK08_R2_PE.fastq.gz,MK09_R2_PE.fastq.gz,HK04_R2_PE.fastq.gz,HK05_R2_PE.fastq.gz,HK06_R2_PE.fastq.gz,HK07_R2_PE.fastq.gz,HK08_R2_PE.fastq.gz,HK09_R2_PE.fastq.gz,HK10_R2_PE.fastq.gz,HK11_R2_PE.fastq.gz,HK12_R2_PE.fastq.gz,HK13_R2_PE.fastq.gz,HK14_R2_PE.fastq.gz,HK15_R2_PE.fastq.gz,HK16_R2_PE.fastq.gz,HK17_R2_PE.fastq.gz,HK18_R2_PE.fastq.gz,HK19_R2_PE.fastq.gz --CPU 32 --min_contig_length 200 --normalize_max_read_cov 50 --full_cleanup --verbose --SS_lib_type RF --output trinity

Crtl +A+D #to exit

#to reattach
screen -r 227521

"


"

## move outputs to trinity folder

mv trinity.Trinity.fasta* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity

## delete extra trinity files

rm -r trinity



####################
### statistics ######
#############
# quality of transcriptome

mkdir trinity_assessment

# copy fasta
cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/trinity.Trinity.fasta /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/assembly_assessment/

perl /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/TrinityStats.pl /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/assembly_assessment/trinity.Trinity.fasta

"########################################
Stats based on ALL transcript contigs:
########################################

        Contig N10: 6697
        Contig N20: 4663
        Contig N30: 3482
        Contig N40: 2603
        Contig N50: 1892

        Median contig length: 432
        Average contig: 935.33
        Total assembled bases: 281046308


#####################################################
## Stats based on ONLY LONGEST ISOFORM per 'GENE':
#####################################################

        Contig N10: 5704
        Contig N20: 3681
        Contig N30: 2448
        Contig N40: 1602
        Contig N50: 1053

        Median contig length: 366
        Average contig: 689.32
        Total assembled bases: 131908212
"

### chat gpt interpretation of these results
"General Assembly Stats (All Contigs)
These statistics represent the overall transcriptome assembly before filtering or collapsing redundant isoforms.

Contig N10: 6697
This means that 10% of the total assembled bases are in contigs that are at least 6,697 bp long. This is the length above which the longest 10% of contigs are found.

Contig N20: 4663
Similarly, 20% of the total bases are contained in contigs of at least 4,663 bp in length.

Contig N30: 3482
30% of the bases are in contigs that are at least 3,482 bp long.

Contig N40: 2603
40% of the bases are in contigs of 2,603 bp or longer.

Contig N50: 1892
This is the N50 value. Half of the total bases are in contigs of at least 1,892 bp. The N50 is an important metric, indicating that the assembly contains a reasonable number of longer contigs, but it could suggest moderate fragmentation if it's too low.

Median contig length: 432 bp
The median length of the contigs is 432 bp, meaning half of the contigs are shorter than this value and half are longer. A relatively low median could suggest the presence of many small, fragmented contigs.

Average contig length: 935.33 bp
This is the average length of all contigs in the assembly. An average contig length of 935.33 bp is moderate, but ideally, you’d want this number to be closer to the N50 or higher.

Total assembled bases: 281,046,308
This is the total number of bases in the entire assembly. It provides an overview of how much transcriptome data was assembled.

Longest Isoform per Gene Stats
These stats represent the assembly after collapsing redundant isoforms, keeping only the longest isoform per gene. This gives a more refined view of the assembly quality.

Contig N10: 5704
10% of the assembled bases are in contigs of at least 5,704 bp, which is shorter compared to the general assembly but still relatively long.

Contig N20: 3681
20% of the bases are in contigs of at least 3,681 bp in length.

Contig N30: 2448
30% of the assembled bases are in contigs of at least 2,448 bp.

Contig N40: 1602
40% of the total bases are contained in contigs of at least 1,602 bp.

Contig N50: 1053
The N50 value here is 1,053 bp, which is lower than the general N50. This suggests that after collapsing isoforms, the overall contig length distribution has shifted toward shorter transcripts, but redundancy is reduced.

Median contig length: 366 bp
The median contig length dropped to 366 bp after collapsing to the longest isoforms, which could indicate that many smaller contigs were selected as the longest representatives of their genes.

Average contig length: 689.32 bp
The average contig length also dropped, reflecting a smaller overall assembly after collapsing.

Total assembled bases: 131,908,212
After collapsing to the longest isoform per gene, the total number of assembled bases is about 131 million, approximately half of the original assembly (281 million). This reduction shows how many redundant transcripts and alternative isoforms were present in the initial assembly.

Interpretation & Recommendations:
Fragmentation: The N50 (1892 bp) and median contig length (432 bp) in the general assembly are reasonable but could indicate a moderate level of fragmentation. However, for the longest isoforms, the N50 (1053 bp) and median length (366 bp) are somewhat lower, suggesting that further refinement might be beneficial.

Redundancy: The significant drop in total assembled bases (281M to 131M) when selecting the longest isoform per gene shows that redundancy (multiple isoforms per gene) is high in the initial assembly. Using Evigene or other post-assembly filtering could further reduce redundancy.

Further Refinement: If you're conducting gene expression analysis or functional annotation, cleaning the assembly with tools like Evigene could improve the quality by focusing on the most biologically relevant transcripts and reducing redundancy and noise.

In summary, while the assembly appears to be moderately complete, reducing redundancy and focusing on more biologically significant transcripts (as with the longest isoform per gene stats) would provide a cleaner dataset for downstream analysis."
