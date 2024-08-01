############################
### 03_assembly ############
############################


cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/


/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity -h



#test - works
/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity --seqType fq --max_memory 512G --left AK01_R1_PE.fastq.gz,AK02_R1_PE.fastq.gz --right AK01_R2_PE.fastq.gz,AK02_R2_PE.fastq.gz --CPU 32 --min_contig_length 200 --normalize_max_read_cov 50 --full_cleanup --verbose --output trinity


## do for real

screen

/Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Trinity --seqType fq --max_memory 512G --left AK01_R1_PE.fastq.gz,AK02_R1_PE.fastq.gz,AK03_R1_PE.fastq.gz,AK04_R1_PE.fastq.gz,AK05_R1_PE.fastq.gz,AK06_R1_PE.fastq.gz,AK07_R1_PE.fastq.gz,AK08_R1_PE.fastq.gz,AK09_R1_PE.fastq.gz,HK01_R1_PE.fastq.gz,HK02_R1_PE.fastq.gz,AK10_R1_PE.fastq.gz,AK11_R1_PE.fastq.gz,AK12_R1_PE.fastq.gz,AK13_R1_PE.fastq.gz,AK14_R1_PE.fastq.gz,AK15_R1_PE.fastq.gz,AK16_R1_PE.fastq.gz,HK03_R1_PE.fastq.gz,AK17_R1_PE.fastq.gz,MK01_R1_PE.fastq.gz,MK02_R1_PE.fastq.gz,MK03_R1_PE.fastq.gz,MK04_R1_PE.fastq.gz,MK05_R1_PE.fastq.gz,MK06_R1_PE.fastq.gz,MK07_R1_PE.fastq.gz,MK08_R1_PE.fastq.gz,MK09_R1_PE.fastq.gz,HK04_R1_PE.fastq.gz,HK05_R1_PE.fastq.gz,HK06_R1_PE.fastq.gz,HK07_R1_PE.fastq.gz,HK08_R1_PE.fastq.gz,HK09_R1_PE.fastq.gz,HK10_R1_PE.fastq.gz,HK11_R1_PE.fastq.gz,HK12_R1_PE.fastq.gz,HK13_R1_PE.fastq.gz,HK14_R1_PE.fastq.gz,HK15_R1_PE.fastq.gz,HK16_R1_PE.fastq.gz,HK17_R1_PE.fastq.gz,HK18_R1_PE.fastq.gz,HK19_R1_PE.fastq.gz --right AK01_R2_PE.fastq.gz,AK02_R2_PE.fastq.gz,AK03_R2_PE.fastq.gz,AK04_R2_PE.fastq.gz,AK05_R2_PE.fastq.gz,AK06_R2_PE.fastq.gz,AK07_R2_PE.fastq.gz,AK08_R2_PE.fastq.gz,AK09_R2_PE.fastq.gz,HK01_R2_PE.fastq.gz,HK02_R2_PE.fastq.gz,AK10_R2_PE.fastq.gz,AK11_R2_PE.fastq.gz,AK12_R2_PE.fastq.gz,AK13_R2_PE.fastq.gz,AK14_R2_PE.fastq.gz,AK15_R2_PE.fastq.gz,AK16_R2_PE.fastq.gz,HK03_R2_PE.fastq.gz,AK17_R2_PE.fastq.gz,MK01_R2_PE.fastq.gz,MK02_R2_PE.fastq.gz,MK03_R2_PE.fastq.gz,MK04_R2_PE.fastq.gz,MK05_R2_PE.fastq.gz,MK06_R2_PE.fastq.gz,MK07_R2_PE.fastq.gz,MK08_R2_PE.fastq.gz,MK09_R2_PE.fastq.gz,HK04_R2_PE.fastq.gz,HK05_R2_PE.fastq.gz,HK06_R2_PE.fastq.gz,HK07_R2_PE.fastq.gz,HK08_R2_PE.fastq.gz,HK09_R2_PE.fastq.gz,HK10_R2_PE.fastq.gz,HK11_R2_PE.fastq.gz,HK12_R2_PE.fastq.gz,HK13_R2_PE.fastq.gz,HK14_R2_PE.fastq.gz,HK15_R2_PE.fastq.gz,HK16_R2_PE.fastq.gz,HK17_R2_PE.fastq.gz,HK18_R2_PE.fastq.gz,HK19_R2_PE.fastq.gz --CPU 32 --min_contig_length 200 --normalize_max_read_cov 50 --full_cleanup --verbose --SS_lib_type RF --output trinity

Crtl +A+D #to exit

#to reattach
screen -r 319987

"
Fully cleaning up.
succeeded(49524)   99.998% completed.

All commands completed successfully. :-)



** Harvesting all assembled transcripts into a single multi-fasta file...
Wednesday, July 31, 2024: 18:21:32      CMD: /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/support_scripts/print_butterfly_assemblies.pl /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity/read_partitions/Fb_0/CBin_6/c661.trinity.reads.fa.out/chrysalis/component_base_listing.txt 200 > /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity/read_partitions/Fb_0/CBin_6/c661.trinity.reads.fa.out/Trinity.tmp.fasta
CMD finished (0 seconds)
* [Wed Jul 31 18:21:32 2024] Running CMD: /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/Analysis/SuperTranscripts/Trinity_gene_splice_modeler.py --trinity_fasta /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity/read_partitions/Fb_0/CBin_6/c661.trinity.reads.fa.out/Trinity.tmp.fasta --out_prefix /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity/read_partitions/Fb_0/CBin_6/c661.trinity.reads.fa.out/Trinity.tmp.fasta.ST --incl_cdna
Wednesday, July 31, 2024: 18:21:33      CMD: mv /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity/read_partitions/Fb_0/CBin_6/c661.trinity.reads.fa.out/Trinity.tmp.fasta.ST.transcripts.fa /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity/read_partitions/Fb_0/CBin_6/c661.trinity.reads.fa.out.Trinity.fasta
CMD finished (0 seconds)


#############################################################################
Finished.  Final Trinity assemblies are written to /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity/read_partitions/Fb_0/CBin_6/c661.trinity.reads.fa.out.Trinity.fasta
#############################################################################


Fully cleaning up.
succeeded(49525)   100% completed.

All commands completed successfully. :-)

CMD finished (7480 seconds)


** Harvesting all assembled transcripts into a single multi-fasta file...

Wednesday, July 31, 2024: 18:21:33      CMD: find /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity/read_partitions/ -name '*inity.fasta'  | /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/support_scripts/partitioned_trinity_aggregator.pl --token_prefix TRINITY_DN --output_prefix /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity/Trinity.tmp
CMD finished (1518 seconds)
* [Wed Jul 31 18:46:51 2024] Running CMD: /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/support_scripts/salmon_runner.pl Trinity.tmp.fasta /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity/both.fa 32
* [Wed Jul 31 18:49:30 2024] Running CMD: /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/support_scripts/filter_transcripts_require_min_cov.pl Trinity.tmp.fasta /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity/both.fa salmon_outdir/quant.sf 2 > /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity.Trinity.fasta


#############################################################################
Finished.  Final Trinity assemblies are written to /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity.Trinity.fasta
#############################################################################


Fully cleaning up.
Wednesday, July 31, 2024: 18:49:47      CMD: /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/support_scripts/get_Trinity_gene_to_trans_map.pl /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity.Trinity.fasta > /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity.Trinity.fasta.gene_trans_map
CMD finished (1 seconds)

"

## move outputs to assembly folder

mv trinity.Trinity.fasta* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/assembly

## delete extra trinity files

rm -r trinity



####################
### statistics ######
#############
# quality of transcriptome

mkdir assembly_assessment

# copy fasta
cp /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/trinity.Trinity.fasta /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/assembly/assembly_assessment/

perl /Volumes/archive/kennylab/LocalProgrammes/trinityrnaseq-v2.14.0/util/TrinityStats.pl /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads3/assembly/assembly_assessment/trinity.Trinity.fasta

"################################
## Counts of transcripts, etc.
################################
Total trinity 'genes':  55402
Total trinity transcripts:      102005
Percent GC: 41.59

########################################
Stats based on ALL transcript contigs:
########################################

        Contig N10: 4871
        Contig N20: 3409
        Contig N30: 2530
        Contig N40: 1923
        Contig N50: 1447

        Median contig length: 458
        Average contig: 857.29
        Total assembled bases: 87448305


#####################################################
## Stats based on ONLY LONGEST ISOFORM per 'GENE':
#####################################################

        Contig N10: 4936
        Contig N20: 3433
        Contig N30: 2548
        Contig N40: 1879
        Contig N50: 1339

        Median contig length: 400
        Average contig: 775.13
        Total assembled bases: 42943940

"

