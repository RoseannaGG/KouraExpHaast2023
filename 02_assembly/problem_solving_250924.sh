



###########################
### EviGene ########
################################
# get rid of replicates - clean up transcriptome


### take 1 - use micromamba
./bin/micromamba shell init -s bash -r ~/micromamba
nano ~/.bashrc

mirocomamba create --name evigene2 evigene
micromamba activate evigene2
micromamba run -n evigene2 perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity.Trinity.fasta -NCPU 1 -MAXMEM 16000 -logfile -species=koura

screen -r 350844

perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity.Trinity.fasta -NCPU 1 -MAXMEM 16000 -logfile -species=koura

"Error: mdb_dbi_open: MDB_NOTFOUND: No matching key/data pair found
Illegal division by zero at /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl line 1915.
"


##  check for weird characters
 head trinity_kawakawa.Trinity.fasta | od -c


## check if it runs on kawakawa file
perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity_kawakawa.Trinity.fasta -NCPU 1 -MAXMEM 16000 -logfile -species=kawakawa
# it does, which suggests that there's something different or missing or wrong with koura file

## try MINAA=20
perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity.Trinity.fasta -NCPU 1 -MAXMEM 16000 -logfile -species=koura -MINAA=20

## try agian no other files or folders
perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity.Trinity.fasta -NCPU 1 -MAXMEM 16000 -logfile -species=koura


## try on biochemcompute3!!

"bash-4.2$ perl /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/prot/tr2aacds4.pl -cdnaseq trinity.Trinity.fasta -NCPU 1 -MAXMEM 16000 -logfile -species=koura
Use of uninitialized value $okaa in -f at /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/genes/../cdna_evigenesub.pm line 814.
Use of uninitialized value $altaa in -f at /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/genes/../cdna_evigenesub.pm line 815.
#readPubidTab(publicset/trinity.Trinity.pubids)= 142340
# nin=502072, nok=213218, nfrag=532, nskipnotloc=268329, nskipdupfrag=3098, nskipdiffloc=16895
#insertUniqExons= 1530
#collectExonChains= 141118 of 141826 ids
#assignChainLoci
#n_class: ichain=119201 icalt=17276 icsub=4641 icdup=708
#n_alts : t1=119201 t2=10960 t3=3702 t4=1508 t5=628 t6=255 t7=106 t8=48 t9=26 t10=18 t11=11 t12=7 t13=3 t14=2 t15=1 t16=1 t17=0 t18=0 t19=0 t20=0
Use of uninitialized value $okaa in -f at /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/genes/../cdna_evigenesub.pm line 814.
Use of uninitialized value $altaa in -f at /Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts/genes/../cdna_evigenesub.pm line 815.
#egr: FATAL Missing mrna
"

screen -r 20875

## logs
/Volumes/archive/userdata/staff_users/roseannagamlen-greene/.logs/