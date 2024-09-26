

###########################
### EviGene ########
################################
# get rid of replicates - clean up transcriptome


mkdir Evigene

# copy fasta
cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/trinity.Trinity.fasta /Volumes/archive/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/

cd /Volumes/archive/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/

export evigene=/Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/evigene

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts
PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene
PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene
PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/exonerate/exonerate-2.2.0-x86_64/bin

screen

perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity.Trinity.fasta -NCPU 8 -MAXMEM 16000 -logfile -species=koura

screen -r 

"

"

###############################
### stats on transcriptome ###
#####################################

# copy fasta
cp /Volumes/archive/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/assembly_assessment/

screen
perl /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/TrinityStats.pl /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/assembly_assessment/trinity.Trinity.okay.tr


"

"


#########################
# blastx ################
#########################
mkdir diamond_evigene


cd /Volumes/archive/kennylab/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/diamond_evigene/


cp /Volumes/archive/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/diamond_evigene/

mkdir xml txt


## xml file
cd /Volumes/archive/kennylab/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/diamond_evigene/xml


cp /Volumes/archive/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/diamond_evigene/xml/

screen
/Volumes/archive/kennylab/LocalProgrammes/diamond/diamond blastx --query trinity.Trinity.okay.tr --db /Volumes/archive/kennylab/LocalProgrammes/diamond_db/diamondnr.dmnd --evalue 0.001 --out kawakawa_evigene_Proteinmodels_diamond.xml --threads 24 --max-target-seqs 1 --outfmt 5 --more-sensitive

screen -r 


## txt file
cd /Volumes/archive/kennylab/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/diamond_evigene/txt/


cp /Volumes/archive/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/diamond_evigene/txt/

screen
/Volumes/archive/kennylab/LocalProgrammes/diamond/diamond blastx --query trinity.Trinity.okay.tr --db /Volumes/archive/kennylab/LocalProgrammes/diamond_db/diamondnr.dmnd --evalue 0.001 --out kawakawa_evigene_Proteinmodels_diamond.txt --threads 24 --max-target-seqs 1 --outfmt 6 qseqid sseqid bitscore --more-sensitive


screen -r 