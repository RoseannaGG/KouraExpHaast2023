
######################
###### 05_index ####### should only take 30min or so
#######################


mkdir star_index

cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/star_index/

screen

STAR --runThreadN 8 --runMode genomeGenerate --genomeDir /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/star_index/ --genomeFastaFiles /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/okayset/trinity.Trinity.okay.tr --sjdbGTFfile /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/annotation_evigene/koura_evigene.gtf --sjdbOverhang 99 --limitGenomeGenerateRAM 201877951872

screen -r 


## ran out of memory on biochemcompute3
free -h # reveals there was only 25GB available memory
"

Sep 25 14:24:26 ..... started STAR run
Sep 25 14:24:26 ... starting to generate Genome files
terminate called after throwing an instance of 'std::bad_alloc'
  what():  std::bad_alloc
Aborted (core dumped)


"


# checked available mem on biochemcompute1
free -h # 887GB!

# so ran on biochemcompute1

screen

STAR --runThreadN 8 --runMode genomeGenerate --genomeDir /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/star_index/ --genomeFastaFiles /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/okayset/trinity.Trinity.okay.tr --sjdbGTFfile /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/annotation_evigene/koura_evigene.gtf --sjdbOverhang 99 --limitGenomeGenerateRAM 201877951872

screen -r 245094

"
Sep 25 14:29:30 ..... started STAR run
Sep 25 14:29:30 ... starting to generate Genome files
Sep 25 14:31:28 ... starting to sort Suffix Array. This may take a long time...
Sep 25 14:32:45 ... sorting Suffix Array chunks and saving them to disk...
Sep 25 14:33:55 ... loading chunks from disk, packing SA...
Sep 25 14:35:02 ... finished generating suffix array
Sep 25 14:35:02 ... generating Suffix Array index
Sep 25 14:35:39 ... completed Suffix Array index
Sep 25 14:35:39 ..... processing annotations GTF
Sep 25 14:35:40 ... writing Genome to disk ...
Sep 25 14:35:56 ... writing Suffix Array to disk ...
Sep 25 14:35:57 ... writing SAindex to disk
Sep 25 14:35:58 ..... finished successfully
"