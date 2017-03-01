#!/bin/bash
#SBATCH --job-name=pl.prod.1
#SBATCH --output=pl.prod.1.err 
#SBATCH --time=48:00:00 
#SBATCH --nodes=1
#SBATCH --partition=mccullagh-gpu
#SBATCH --gres=gpu:titan:1
##SBATCH --exclusive 

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/software/usr/gcc-4.9.2/lib64"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/software/usr/hpcx-v1.2.0-292-gcc-MLNX_OFED_LINUX-2.4-1.0.0-redhat6.6/ompi-mellanox-v1.8/lib"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda-7.5/lib64"
export AMBERHOME="/mnt/lustre_fs/users/mjmcc/apps/amber16"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$AMBERHOME/lib"

$AMBERHOME/bin/pmemd.cuda -O -i pl.prod.1.in -o pl.prod.1.log -p ../1F40_ligand.solv.ion.prmtop -c ../../../min_heat_equil/equil.5/pl.equil5.rst -x pl.prod.1.ncdf -r pl.prod.1.rst -inf pl.prod.1.mdinfo


cpptrajhome=$AMBERHOME/AmberTools/bin/
echo $cpptrajhome
cd ../Truncated
time ./truncation.md.py pl production.1 $cpptrajhome