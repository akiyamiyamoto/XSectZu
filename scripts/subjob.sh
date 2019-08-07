#!/bin/bash 
#
# Submit whizard2 jobs using the sindarin file in specified directory.
#
# Usage:
#
#  subjob.sh sindarin/<dir>/<file>
#
#  A string before "/" is considered as the directory.
#  A string after "/" is considered as the sindarin file.
#  
#  Job results are in jobs/<sindir>/<sinfile>
#

whiz2_setup="/cvmfs/clicdp.cern.ch/software/WHIZARD/2.7.0/x86_64-slc6-gcc7-opt/setup.sh"

sinpath=${1}
topdir=`pwd`
dirn=`dirname ${sinpath} `
basen=`basename ${sinpath}`

if [ ! -e ${sinpath} ] ; then 
  echo "${sinpath} does not exist."
  exit
fi

jobname=`echo ${basen} | sed -e "s/\.sin$//"`
jobdir=`echo "${dirn}/${jobname}" | sed -e "s|sindarin|jobs|"`
sinfile=${topdir}/${sinpath}
mkdir -p ${jobdir}

cd ${jobdir}
bsub -o sub.log -J ${jobname} "( ( source ${whiz2_setup} && whizard ${sinfile} ) > job.log 2>&1 )"

