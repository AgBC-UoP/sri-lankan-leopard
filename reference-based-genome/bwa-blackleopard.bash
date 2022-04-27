#!/bin/bash
#title           :bwa-blackleopard.bash
#description     :This script will map reads to leopard reference genome and duplicate reads will be marked
#author		 :Shyaman Jayasundara (jmshyaman@eng.pdn.ac.lk)
#date            :27/04/2022
#usage		 :./bwa-blackleopard.bash
#dependencies           : bwa, samtools, picard
#==============================================================================

set -euf -o pipefail

mkdir -p out

bwa mem -R '@RG\tID:18160D\tSM:BlackLeopard\tLB:library1' \
-M -t 36 \
/leopard_wildlife/ref_sequences/ref_panpar1_hic/PanPar1.0_HiC.fasta.gz \
/leopard_wildlife/raw_seq_data/18160-07/18160D-07-01V4_S0_L001_R1.fastq.gz \
/leopard_wildlife/raw_seq_data/18160-07/18160D-07-01V4_S0_L001_R2.fastq.gz | \
samtools fixmate -m -@ 2 - - | samtools sort -@ 8 - -o out/out.bam

java -Xmx80g -jar /tools/picard.jar MarkDuplicates -I out/out.bam -O out/out_markdup.bam -M out/out_metrics.txt --CREATE_INDEX true --REMOVE_DUPLICATES

samtools coverage out/out_markdup.bam -o coverage_stats.txt