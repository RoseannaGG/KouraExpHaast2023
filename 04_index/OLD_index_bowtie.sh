


######################
###### 05_index ####### should only take 30min or so
#######################


mkdir bowtie_index 

cd /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/bowtie_index/

# use alignment folder in next step 06
mkdir genome alignment

screen

bowtie2-build /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/okayset/trinity.Trinity.okay.tr /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/bowtie_index/genome

screen -r 8466


"
Exited Ebwt loop
fchr[A]: 0
fchr[C]: 31467283
fchr[G]: 51786184
fchr[T]: 73947584
fchr[$]: 106072732
Exiting Ebwt::buildToDisk()
Returning from initFromVector
Wrote 56162371 bytes to primary EBWT file: /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/bowtie_index/genome.rev.1.bt2
Wrote 26518188 bytes to secondary EBWT file: /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/bowtie_index/genome.rev.2.bt2
Re-opening _in1 and _in2 as input streams
Returning from Ebwt constructor
Headers:
    len: 106072732
    bwtLen: 106072733
    sz: 26518183
    bwtSz: 26518184
    lineRate: 6
    offRate: 4
    offMask: 0xfffffff0
    ftabChars: 10
    eftabLen: 20
    eftabSz: 80
    ftabLen: 1048577
    ftabSz: 4194308
    offsLen: 6629546
    offsSz: 26518184
    lineSz: 64
    sideSz: 64
    sideBwtSz: 48
    sideBwtLen: 192
    numSides: 552463
    numLines: 552463
    ebwtTotLen: 35357632
    ebwtTotSz: 35357632
    color: 0
    reverse: 1
Total time for backward call to driver() for mirror index: 00:00:57
roseannagamlen-greene@biochemcompute3:/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/bowtie_index/genome$
"


# if genome outputs didn't go into genome folder, move them

mv genome.* /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/bowtie_index/genome/






## or???

bowtie2-build /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/annotation_evigene/trinity.Trinity.okay.fasta /Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/EviGene/bowtie_index/genome
