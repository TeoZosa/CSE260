#!/bin/bash
# This script is intepreted by the Bourne Shell, sh
#
# Documentation for SGE is found in:
# http://docs.oracle.com/cd/E19279-01/820-3257-12/n1ge.html
#
# Tell SGE which shell to run the job script in rather than depending
# on SGE to try and figure it out.
#$ -S /bin/bash
#
# Export all my environment variables to the job
#$ -V
#
# Tun the job in the same directory from which you submitted it
#$ -cwd
#
#
# --- Don't change anything above this line ---
#
# Give a name to the job
#$ -N bang_1core
#
# Specify a time limit for the job, not more than 30 minutes
#$ -l h_rt=00:02:00
#
# Specify the parallel environment and number of cores,
# If not a multiple of 8, you'll get the whole node anyway
#$ -pe orte 1
#
# Join stdout and stderr so they are reported in job output file
#$ -j y
#
#
# Choose the queue to run the job
#
# Debug queue: only one node may be used at a time for up to 30 minutes
# Interactive or batch jobs, maximum of 1 job per user running at a time
#
# Debug queue jobs may use only 1 node for up to 20 minutes
#$ -q debug.q
#
# Specifies the circumstances under which mail is to be sent to the job owner
# defined by -M option. For example, options "bea" cause mail to be sent at the 
# begining, end, and at abort time (if it happens) of the job.
# Option "n" means no mail will be sent.
#$ -m aeb
#
# *** Change to the address you want the notification sent to, and
#$ -M yourLogin@ucsd.edu
#


echo
echo " *** Current working directory"
pwd
echo
echo " *** Compiler"
# Output which  compiler are we using and the environment
mpicc -v
echo
echo " *** Environment"
printenv

echo

echo ">>> Job Starts"
date
./apf -n 150 -i 400

date
echo ">>> __APF-REF__"
./apf-ref/apf -n 150 -i 400

echo ">>> Job Ends"
