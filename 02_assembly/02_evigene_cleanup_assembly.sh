

###########################
### EviGene ########
################################
# get rid of replicates - clean up transcriptome


mkdir EviGene

# copy fasta
cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/trinity.Trinity.fasta /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/


cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/


## put all dependencies in ~/.bashrc file
nano ~/.bashrc

# set prompt
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
# save each command run into ~/.logs/ for each day
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(hostname) $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'




export PATH=$PATH:/usr/bin/

export PATH="/Volumes/archive/kennylab/LocalProgrammes/exonerate/exonerate-2.2.0-x86_64/bin:$PATH"

export PATH="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/cdhit:$PATH"

export PATH="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/evigene/scripts/prot/cdhit:$PATH"

export PATH="/Volumes/archive/kennylab/LocalProgrammes/cdhit/cdhit:$PATH"

export PATH="/Volumes/archive/userdata/staff_users/roseannagamlen-greene/.conda:$PATH"

export PATH="/Volumes/archive/kennylab/LocalProgrammes/Blast/ncbi-blast-2.13.0+/bin:$PATH"

export PATH="/Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene:$PATH"


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/Volumes/archive/userdata/staff_users/roseannagamlen-greene/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Volumes/archive/userdata/staff_users/roseannagamlen-greene/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<


## run on biochemcompute3
# make sure no other files or folders in working dir before running
# takes about 30min
screen
perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity.Trinity.fasta -NCPU 1 -MAXMEM 16000 -logfile -species=koura




###############################
### stats on transcriptome ###
#####################################
mkdir assembly_assessment

# copy fasta
cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/assembly_assessment/

screen
perl /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/TrinityStats.pl /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/assembly_assessment/trinity.Trinity.okay.tr
screen -r 85936

"

################################
## Counts of transcripts, etc.
################################
Total trinity 'genes':  96367
Total trinity transcripts:      110185
Percent GC: 40.05

########################################
Stats based on ALL transcript contigs:
########################################

        Contig N10: 5996
        Contig N20: 4141
        Contig N30: 3069
        Contig N40: 2276
        Contig N50: 1654

        Median contig length: 509
        Average contig: 962.68
        Total assembled bases: 106072732


#####################################################
## Stats based on ONLY LONGEST ISOFORM per 'GENE':
#####################################################

        Contig N10: 6102
        Contig N20: 4188
        Contig N30: 3082
        Contig N40: 2241
        Contig N50: 1594

        Median contig length: 493
        Average contig: 934.12
        Total assembled bases: 90018623

"


######## HOW DO THESE STATS COMPARE TO THE VERSION BEFORE EVIGENE? 

"1. Stats Based on All Transcript Contigs
Metric	Before	After (EviGene)	Change
Contig N10	6697 bp	5996 bp	⬇ 701 bp
Contig N20	4663 bp	4141 bp	⬇ 522 bp
Contig N30	3482 bp	3069 bp	⬇ 413 bp
Contig N40	2603 bp	2276 bp	⬇ 327 bp
Contig N50	1892 bp	1654 bp	⬇ 238 bp
Median Contig Length	432 bp	509 bp	⬆ 77 bp
Average Contig Length	935.33 bp	962.68 bp	⬆ 27.35 bp
Total Assembled Bases	281,046,308 bp	106,072,732 bp	⬇ 174,973,576 bp
Interpretation of Changes:
N-values decreased (N10, N20, N30, N40, N50):

N-values (e.g., N50) dropped slightly, indicating that the longest contigs make up a smaller percentage of the assembly. This is expected after cleaning up the transcriptome with EviGene, which filters out low-quality, redundant, or fragmented sequences, focusing on representative transcripts.
Median contig length increased from 432 bp to 509 bp:

The median length of contigs improved, meaning a larger proportion of your transcripts are now longer. This indicates better quality and completeness of transcripts after cleanup.
Average contig length increased slightly from 935.33 bp to 962.68 bp:

A small increase in the average contig length shows that although the assembly is now smaller, it is composed of higher-quality, longer transcripts.
Total assembled bases dropped significantly:

The total base count dropped from 281 Mb to 106 Mb. This indicates a substantial reduction in redundant and potentially low-quality transcripts, resulting in a cleaner and more streamlined assembly.
2. Stats Based on Only Longest Isoform per Gene
Metric	Before	After (EviGene)	Change
Contig N10	5704 bp	6102 bp	⬆ 398 bp
Contig N20	3681 bp	4188 bp	⬆ 507 bp
Contig N30	2448 bp	3082 bp	⬆ 634 bp
Contig N40	1602 bp	2241 bp	⬆ 639 bp
Contig N50	1053 bp	1594 bp	⬆ 541 bp
Median Contig Length	366 bp	493 bp	⬆ 127 bp
Average Contig Length	689.32 bp	934.12 bp	⬆ 244.8 bp
Total Assembled Bases	131,908,212 bp	90,018,623 bp	⬇ 41,889,589 bp
Interpretation of Changes:
N-values improved significantly (N10, N20, N30, N40, N50):

N50 increased from 1053 bp to 1594 bp, indicating that the longest isoforms are now substantially longer. This suggests that after filtering, the assembly retained longer and more complete isoforms, improving transcript quality.
Median contig length increased from 366 bp to 493 bp:

This is a substantial improvement, indicating that the median gene isoform is now longer, reflecting better representation of full-length transcripts.
Average contig length increased from 689.32 bp to 934.12 bp:

The average isoform length increased significantly, suggesting that after removing low-quality or redundant isoforms, the transcriptome retained longer and likely more biologically meaningful isoforms.
Total assembled bases decreased from 131 Mb to 90 Mb:

The total number of bases for the longest isoforms per gene is reduced, reflecting the removal of redundant transcripts and cleaner data. However, even with fewer bases, the quality of retained transcripts has improved.
Overall Improvements:
Higher transcript quality: While the total number of bases and contigs decreased, the remaining transcriptome has longer, higher-quality transcripts.
Better gene representation: The improvements in N-values and average contig lengths suggest that you now have a cleaner set of gene isoforms, which is more likely to represent biologically meaningful full-length transcripts.
Streamlined data: The reduction in total bases and contigs indicates less redundancy, meaning that you're working with a cleaner, more representative set of transcripts, which is ideal for downstream analysis like annotation and differential expression.
In conclusion, the cleanup with EviGene successfully reduced redundancy and low-quality transcripts while improving the overall quality of the transcriptome, as seen by the higher N-values and median/average contig lengths for the longest isoforms. This should provide a more accurate and efficient dataset for further analysis."








#########################
# blastx ################
#########################
mkdir diamond_evigene


cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/diamond_evigene/


cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/diamond_evigene/

mkdir xml txt


## xml file
cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/diamond_evigene/xml


cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/diamond_evigene/xml/

screen
/Volumes/archive/kennylab/LocalProgrammes/diamond/diamond blastx --query trinity.Trinity.okay.tr --db /Volumes/archive/kennylab/LocalProgrammes/diamond_db/diamondnr.dmnd --evalue 0.001 --out kawakawa_evigene_Proteinmodels_diamond.xml --threads 24 --max-target-seqs 1 --outfmt 5 --more-sensitive

screen -r 88245


## txt file
cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/diamond_evigene/txt/


cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/diamond_evigene/txt/

screen
/Volumes/archive/kennylab/LocalProgrammes/diamond/diamond blastx --query trinity.Trinity.okay.tr --db /Volumes/archive/kennylab/LocalProgrammes/diamond_db/diamondnr.dmnd --evalue 0.001 --out kawakawa_evigene_Proteinmodels_diamond.txt --threads 24 --max-target-seqs 1 --outfmt 6 qseqid sseqid bitscore --more-sensitive


screen -r 88628
