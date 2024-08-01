
######################
###### 05_index ####### should only take 30min or so
#######################


mkdir star_index

cd /Volumes/archive/kennylab/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/star_index/

screen

STAR --runThreadN 8 --runMode genomeGenerate --genomeDir /Volumes/archive/kennylab/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/star_index/ --genomeFastaFiles /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/okayset/trinity.Trinity.okay.tr --sjdbGTFfile /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/annotation_evigene/kawakawa_evigene.gtf --sjdbOverhang 99 --limitGenomeGenerateRAM 201877951872

screen -r 



"


"
