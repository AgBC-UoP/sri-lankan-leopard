#!/bin/bash
#title           :variant-filter-blackleopard.bash
#description     :This script will filter variants from vcf file
#author		 :Shyaman Jayasundara (jmshyaman@eng.pdn.ac.lk)
#date            :27/04/2022
#usage		 :./variant-filter-blackleopard.bash
#dependencies           :vcftools
#==============================================================================

vcftools --vcf variant/variants.vcf --minQ 40 --minDP 5 --maxDP 100 --recode --recode-INFO-all --out variant/variants_q40_dp5 &> variant-filter.log
