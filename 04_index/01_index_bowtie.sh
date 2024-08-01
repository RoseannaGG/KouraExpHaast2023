


######################
###### 05_index ####### should only take 30min or so
#######################


mkdir bowtie_index

mkdir genome

screen

bowtie2-build /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/bowtie_index/genome

screen -r 

## or???

bowtie2-build /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/annotation_evigene/trinity.Trinity.okay.fasta /Volumes/archive/kennylab/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/bowtie_index/genome
