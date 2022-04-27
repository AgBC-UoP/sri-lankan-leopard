#!/bin/bash
#title           :assembly.bash
#description     :This script will assemble mt genome
#author		 :Shyaman Jayasundara (jmshyaman@eng.pdn.ac.lk)
#date            :27/04/2022
#usage		 :./assembly.bash
#dependencies           :Mitoz singularity image 
#==============================================================================

~/singularity_images/MitoZ.simg all2 --config mitoz_all2_config.txt \
1>mitoz.log 2>mitoz.err


