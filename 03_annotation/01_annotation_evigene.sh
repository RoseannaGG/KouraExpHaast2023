##############################
### 04_annotation_evigene
###############################
mkdir annotation_evigene

cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/assembly_assessment/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/annotation_evigene/

#rename to have fasta extension
mv trinity.Trinity.okay.tr trinity_Trinity_okaytr.fasta


screen

/Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t trinity_Trinity_okaytr.fasta -m 50

"
"

screen 

/Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/TransDecoder.Predict -t trinity_Trinity_okaytr.fasta --single_best_only

screen -r 



## converting from gff3 to gtf

cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads_adap/trinity/Evigene/annotation_evigene/

screen

/Volumes/archive/kennylab/LocalProgrammes/gffread/gffread -T trinity_Trinity_okaytr.fasta.transdecoder.gff3 -o koura_evigene.gtf

screen -r 1


