#!/bin/bash
#SBATCH --job-name=pl.lamb.3.prod.1
#SBATCH --output=pl.lamb.3.prod.1.err
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --mail-type=END # Type of email notification- Available Options (BEGIN,END,FAIL,ALL) 
#SBATCH --mail-user=dupontke@colostate.edu # Email to which notifications will be sent

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/software/usr/gcc-4.9.2/lib64"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/software/usr/hpcx-v1.2.0-292-gcc-MLNX\
_OFED_LINUX-2.4-1.0.0-redhat6.6/ompi-mellanox-v1.8/lib"
export AMBERHOME="/mnt/lustre_fs/users/mjmcc/apps/amber14"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$AMBERHOME/lib"

srun -N1 -n20 $AMBERHOME/bin/pmemd.MPI -O -i pl.lamb.3.prod.1.in -o pl.lamb.3.prod.1.log -p ../../../1F40_ligand_solv.prmtop -c ../../lambda.2/production.1/pl.lamb.2.prod.1.rst -ref ../../lambda.2/production.1/pl.lamb.2.prod.1.rst -inf pl.lamb.3.prod.1.mdinfo -e pl.lamb.3.prod.1.en -x pl.lamb.3.prod.1.ncdf -r pl.lamb.3.prod.1.rst

