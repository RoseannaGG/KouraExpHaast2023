##############################
### 04_annotation_evigene
###############################
mkdir annotation_evigene

cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/annotation_evigene/

#rename to have fasta extension
mv trinity.Trinity.okay.tr trinity_Trinity_okaytr.fasta


# TransDecoder.LongOrfs: This step identifies long open reading frames (ORFs) from the transcript sequences in the input file (trinity_Trinity_okaytr.fasta in your case). It extracts candidate sequences that may encode proteins. This step generates intermediate files required for the next step.

screen

/Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t trinity_Trinity_okaytr.fasta -m 50
screen -r 82047

"roseannagamlen-greene@biochemcompute3:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/annotation_evigene$ /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t trinity_Trinity_okaytr.fasta -m 50
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/compute_base_probs.pl trinity_Trinity_okaytr.fasta 0 > /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/annotation_evigene/trinity_Trinity_okaytr.fasta.transdecoder_dir/base_freqs.dat


-first extracting base frequencies, we'll need them later.


- extracting ORFs from transcripts.
-total transcripts to examine: 110185
[110100/110185] = 99.92% done    CMD: touch /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/annotation_evigene/trinity_Trinity_okaytr.fasta.transdecoder_dir.__checkpoints_longorfs/TD.longorfs.ok


#################################
### Done preparing long ORFs.  ###
##################################

        Use file: /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/annotation_evigene/trinity_Trinity_okaytr.fasta.transdecoder_dir/longest_orfs.pep  for Pfam and/or BlastP searches to enable homology-based coding region identification.

        Then, run TransDecoder.Predict for your final coding region predictions.

"

## when finsihed, run predict
# TransDecoder.Predict: This step takes the results from the LongOrfs step and predicts which of the identified ORFs are most likely to be real protein-coding sequences. It uses the ORFs identified in the first step, so you need to wait for LongOrfs to finish before running Predict.

screen 

/Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/TransDecoder.Predict -t trinity_Trinity_okaytr.fasta --single_best_only

screen -r 82047

"
-feature swap of score: 5.25858934928361 instead of 2.29451208429413
-num feature swaps: 101
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/PWM/feature_scoring.+-.pl  --features_plus trinity_Trinity_okaytr.fasta.transdecoder_dir/start_refinement.enhanced.+.features  --features_minus trinity_Trinity_okaytr.fasta.transdecoder_dir/start_refinement.-.features  --atg_position 20  > trinity_Trinity_okaytr.fasta.transdecoder_dir/start_refinement.enhanced.feature.scores
-round: 1
-round: 2
-round: 3
-round: 4
-round: 5
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/PWM/feature_scores_to_ROC.pl trinity_Trinity_okaytr.fasta.transdecoder_dir/start_refinement.enhanced.feature.scores > trinity_Trinity_okaytr.fasta.transdecoder_dir/start_refinement.enhanced.feature.scores.roc
-parsing scores
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/PWM/plot_ROC.Rscript trinity_Trinity_okaytr.fasta.transdecoder_dir/start_refinement.enhanced.feature.scores.roc || :
null device
          1
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/PWM/compute_AUC.pl trinity_Trinity_okaytr.fasta.transdecoder_dir/start_refinement.enhanced.feature.scores.roc
null device
          1
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/PWM/make_seqLogo.Rscript trinity_Trinity_okaytr.fasta.transdecoder_dir/start_refinement.enhanced.+.pwm || :
Error in library(seqLogo) : there is no package called ‘seqLogo’
Execution halted
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/start_codon_refinement.pl --transcripts trinity_Trinity_okaytr.fasta --gff3_file trinity_Trinity_okaytr.fasta.transdecoder_dir/longest_orfs.cds.best_candidates.gff3 --workdir trinity_Trinity_okaytr.fasta.transdecoder_dir > trinity_Trinity_okaytr.fasta.transdecoder_dir/longest_orfs.cds.best_candidates.gff3.revised_starts.gff3
Refining start codon selections.
-number of revised start positions: 2230
* Running CMD: cp trinity_Trinity_okaytr.fasta.transdecoder_dir/longest_orfs.cds.best_candidates.gff3.revised_starts.gff3 trinity_Trinity_okaytr.fasta.transdecoder.gff3
copying output to final output file: trinity_Trinity_okaytr.fasta.transdecoder.gff3* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/gff3_file_to_bed.pl trinity_Trinity_okaytr.fasta.transdecoder.gff3 > trinity_Trinity_okaytr.fasta.transdecoder.bed
Making bed file: trinity_Trinity_okaytr.fasta.transdecoder.bed
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/gff3_file_to_proteins.pl --gff3 trinity_Trinity_okaytr.fasta.transdecoder.gff3 --fasta trinity_Trinity_okaytr.fasta  --genetic_code Universal > trinity_Trinity_okaytr.fasta.transdecoder.pep
Making pep file: trinity_Trinity_okaytr.fasta.transdecoder.pep
* Running CMD: /Volumes/archive/kennylab/LocalProgrammes/transdecoder/TransDecoder-TransDecoder-v5.5.0/util/gff3_file_to_proteins.pl --gff3 trinity_Trinity_okaytr.fasta.transdecoder.gff3 --fasta trinity_Trinity_okaytr.fasta --seqType CDS  --genetic_code Universal > trinity_Trinity_okaytr.fasta.transdecoder.cds
Making cds file: trinity_Trinity_okaytr.fasta.transdecoder.cds
transdecoder is finished.  See output files trinity_Trinity_okaytr.fasta.transdecoder.*


"

## converting from gff3 to gtf

cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/annotation_evigene/

screen

/Volumes/archive/kennylab/LocalProgrammes/gffread/gffread -T trinity_Trinity_okaytr.fasta.transdecoder.gff3 -o koura_evigene.gtf

screen -r 

