
#####################
## 01_preprocessing ######
#######################

######### Fast QC ###########################



# download original reads

wget https://launch.basespace.illumina.com/CLI/latest/amd64-linux/bs -O $HOME/bin/bs

 

chmod u+x $HOME/bin/bs

 

$HOME/bin/bs auth

 

#(go to the website it tells you to, and log in)

 

$HOME/bin/bs list project


screen

$HOME/bin/bs download project -i 424727654 --extension=fastq.gz -o /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/original_rawreads/



#copy files from multiple subdirectories into one directory  
screen            
rsync -zv /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/original_rawreads/AA*/*gz /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/original_rawreads/rawreads/    

screen -r 117850




screen -r 217014


#copy files from multiple subdirectories into one directory    
$ zcat AACJHF5HV-9100-03-00-01_S3_L001_R1_001.fastq.gz
@VH00684:139:AACJHF5HV:1:1101:64472:1000 1:N:0:TTCACTCACT+TCTCATGATA
GGGCAGCATATGCTAGACGAGTGTTTTTTGCCATTTGGTCATGTACAAAGTTGACTACATCAGGTCTAATGGGGGCACGGAACACAGCTGGCAGTGAAACATTCACACCAGACACTGCTCCATCAATATGACTGTCTCTTATACACAACTC
+
-;;-CC;CCCCCCC-;-CC-C-C;CC--CCCCCCCCC-CCC-C;CCCCC-CCCCCCCCCCCCC;CCCC;CCCCCC;CCCCCCCCC;CCCCCCC;CCCC;C-CCC;CCCCC;CC;-CC-CCCCC;CC-CCCC;CC-CCCC;CC-CC-C-;CC




$ zcat AK03_R1.fastq.gz
@VH00684:139:AACJHF5HV:1:1101:64472:1000 1:N:0:TTCACTCACT+TCTCATGATA
GGGCAGCATATGCTAGACGAGTGTTTTTTGCCATTTGGTCATGTACAAAGTTGACTACATCAGGTCTAATGGGGGCACGGAACACAGCTGGCAGTGAAACATTCACACCAGACACTGCTCCATCAATATGACTGTCTCTTATACACAACTC
+
-;;-CC;CCCCCCC-;-CC-C-C;CC--CCCCCCCCC-CCC-C;CCCCC-CCCCCCCCCCCCC;CCCC;CCCCCC;CCCCCCCCC;CCCCCCC;CCCC;C-CCC;CCCCC;CC;-CC-CCCCC;CC-CCCC;CC-CCCC;CC-CC-C-;CC


screen

rsync -zv /Volumes/archive/kennylab/RoseannaKouraProject/NextSeq/*gz /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/

screen -r 365179




### RENAME FILES


#create excel file with sample names


# replace tab with space


# remove space between name and .fastq.gz

# create txt file that has all the commands

# e.g. 
mv AACJHF5HV-9100-01-00-01_S1_L001_R1_001.fastq.gz AK01_R1.fastq.gz



#copy forward reads and reverse reads into sep folders
cp *R1.fastq.gz files_R1
cp *R2.fastq.gz files_R2


## run fastqc on both

fastqc * -o fastqc

screen -r 285396

screen -r 312945

cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/rawreads/files_R1/fastqc

# run multiqc on contents of both folders
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
multiqc .

