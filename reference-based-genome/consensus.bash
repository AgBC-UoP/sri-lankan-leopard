#!/bin/bash
#title           :consensus-genome.bash
#description     :This script will generate reference based genome assembly(fasta)
#author		 :Shyaman Jayasundara (jmshyaman@eng.pdn.ac.lk)
#date            :27/04/2022
#usage		 :./consensus-genome.bash
#dependencies           : bgzip, bcftools
#==============================================================================

bgzip -@ 36 variant/variants_q40_dp5.recode.vcf

bcftools stats variant/variants_q40_dp5.recode.vcf.gz > bcftools_stats.txt

bcftools index variant/variants_q40_dp5.recode.vcf.gz

cat /leopard_wildlife/ref_sequences/ref_panpar1_hic/PanPar1.0_HiC.fasta | bcftools consensus variant/variants_q40_dp5.recode.vcf.gz > variant/consensus.fa
