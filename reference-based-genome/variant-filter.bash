#!/bin/bash
#title           :variant-filter.bash
#description     :This script will call variants
#author		 :Shyaman Jayasundara (jmshyaman@eng.pdn.ac.lk)
#date            :27/04/2022
#usage		 :./variant-filter.bash
#dependencies           : freebayes
#==============================================================================

vcftools --vcf variant/variants.vcf --minQ 40 --minDP 5 --maxDP 50 --recode --recode-INFO-all --out variant/variants_q40_dp5 &> variant-filter.log
