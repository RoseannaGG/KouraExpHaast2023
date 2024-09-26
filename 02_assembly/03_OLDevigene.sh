

###########################
### EviGene ########
################################
# get rid of replicates - clean up transcriptome


mkdir Evigene

# copy fasta
cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/trinity.Trinity.fasta /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/


cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/

## on biochemcompute1
export PATH=$PATH:/usr/bin/

export PATH="/Volumes/archive/kennylab/LocalProgrammes/exonerate/exonerate-2.2.0-x86_64/bin:$PATH"

export PATH="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/cdhit:$PATH"

export PATH="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/evigene/scripts/prot/cdhit:$PATH"

export PATH="/Volumes/archive/kennylab/LocalProgrammes/cdhit/cdhit:$PATH"

export PATH="/usr/bin/perl:$PATH"


##  take 6 micromamba evigene


mirocomamba create --name evigene2 evigene
micromamba activate evigene2
micromamba run -n evigene2 perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity.Trinity.fasta -NCPU 1 -MAXMEM 16000 -logfile -species=koura

screen -r 350844

perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity.Trinity.fasta -NCPU 1 -MAXMEM 16000 -logfile -species=koura

"Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Illegal division by zero at /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl line 1915.
"

## take 5 - 
## edit fasta from >TRINITY_DN103985_c0_g1_i1 len=322 path=[0:0-321] to this >TRINITY_DN103985_c0_g1_i1_len_322_path_0-0-321
## added path to different blast and also evigene and changed NPCU to 1

sed -e 's/ len=\([0-9]*\)/_len_\1/' -e 's/ path=\[\([0-9]*\):\([0-9]*\)-\([0-9]*\)\]/_path_\1_\2-\3/' trinity.Trinity.fasta > trinity.koura.fasta

export evigene=/Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene

export PATH="/Volumes/archive/kennylab/LocalProgrammes/Blast/ncbi-blast-2.13.0+/bin:$PATH"



screen
perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity.koura.fasta -NCPU 1 -MAXMEM 16000 -logfile -species=koura

screen -r 202847


screen

perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity.Trinity.fasta -NCPU 1 -MAXMEM 16000 -logfile -species=koura

screen -r 350844

## take 4


## added path to different blast and also evigene and changed NPCU to 1
export evigene=/Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene

export PATH="/Volumes/archive/kennylab/LocalProgrammes/Blast/ncbi-blast-2.13.0+/bin:$PATH"

screen -r 87351

"Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Illegal division by zero at /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl line 1915.
"

#take 3

#added path to blastn
export PATH="/usr/bin/blastn:$PATH"

screen -r 79376

"bash-4.2$ perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity.Trinity.fasta -NCPU 8 -MAXMEM 16000 -logfile -species=koura
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
#t2ac: FATAL ERR=blastn_cds_ncpu nfail=8, nok=0, fatal cmd= /usr/bin/blastn -task megablast  -ungapped -xdrop_ungap 4 -dust no -perc_identity 98 -evalue 1e-19 -outfmt 7 -db trinity.Trinitynrcd1x_db
"

# take 2
screen -r 192186
 
 "bash-4.2$ perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity.Trinity.fasta -NCPU 8 -MAXMEM 16000 -logfile -species=koura
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
#t2ac: FATAL ERR=blastn_cds_ncpu nfail=8, nok=0, fatal cmd= /usr/bin/blastn -task megablast  -ungapped -xdrop_ungap 4 -dust no -perc_identity 98 -evalue 1e-19 -outfmt 7 -db trinity.Trinitynrcd1x_db
"

# take 1


screen -r 331847

"
bash-4.2$ perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity.Trinity.fasta -NCPU 8 -MAXMEM 16000 -logfile -species=koura
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
#t2ac: FATAL ERR=blastn_cds_ncpu nfail=8, nok=0, fatal cmd= /usr/bin/blastn -task megablast  -ungapped -xdrop_ungap 4 -dust no -perc_identity 98 -evalue 1e-19 -outfmt 7 -db trinity.Trinitynrcd1x_db

"

###############################
### stats on transcriptome ###
#####################################

# copy fasta
cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/assembly_assessment/

screen
perl /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/TrinityStats.pl /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/assembly_assessment/trinity.Trinity.okay.tr


"

"


#########################
# blastx ################
#########################
mkdir diamond_evigene


cd /Volumes/archive/kennylab/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/diamond_evigene/


cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/diamond_evigene/

mkdir xml txt


## xml file
cd /Volumes/archive/kennylab/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/diamond_evigene/xml


cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/diamond_evigene/xml/

screen
/Volumes/archive/kennylab/LocalProgrammes/diamond/diamond blastx --query trinity.Trinity.okay.tr --db /Volumes/archive/kennylab/LocalProgrammes/diamond_db/diamondnr.dmnd --evalue 0.001 --out kawakawa_evigene_Proteinmodels_diamond.xml --threads 24 --max-target-seqs 1 --outfmt 5 --more-sensitive

screen -r 


## txt file
cd /Volumes/archive/kennylab/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/diamond_evigene/txt/


cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/diamond_evigene/txt/

screen
/Volumes/archive/kennylab/LocalProgrammes/diamond/diamond blastx --query trinity.Trinity.okay.tr --db /Volumes/archive/kennylab/LocalProgrammes/diamond_db/diamondnr.dmnd --evalue 0.001 --out kawakawa_evigene_Proteinmodels_diamond.txt --threads 24 --max-target-seqs 1 --outfmt 6 qseqid sseqid bitscore --more-sensitive


screen -r 



export PATH="/Volumes/archive/kennylab/LocalProgrammes/FASconCAT/"
