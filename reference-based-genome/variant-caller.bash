#!/bin/bash
#title           :variant-caller.bash
#description     :This script will call variants
#author		 :Shyaman Jayasundara (jmshyaman@eng.pdn.ac.lk)
#date            :27/04/2022
#usage		 :./variant-caller.bash
#dependencies           : freebayes
#==============================================================================

mkdir -p variant
ulimit -s 81920

freebayes-parallel <(/tools/freebayes/scripts/fasta_generate_regions.py /leopard_wildlife/ref_sequences/ref_panpar1_hic/PanPar1.0_HiC.fasta 1000000) 36 \
    -f /leopard_wildlife/ref_sequences/ref_panpar1_hic/PanPar1.0_HiC.fasta out/out_markdup.bam > variant/variants.vcf
