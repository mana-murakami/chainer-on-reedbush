#!/bin/bash
#PBS -q h-tutorial
#PBS -l select=2:mpiprocs=2:ompthreads=1
#PBS -W group_list=gt00
#PBS -l walltime=00:15:00


MYDIR=/lustre/pz0415/z30415

. /etc/profile.d/modules.sh
module load chainer/7.0.0
module load openmpi/gdr/2.1.2/gnu
export PYTHONUSERBASE=$MYDIR/.python

cd $MYDIR/chainer-on-reedbush

# デバッグ出力： Chainer と CuPy のバージョンを表示
python -c "import chainer; print(chainer.print_runtime_info())"

mpiexec -x PYTHONUSERBASE \
        python ./train_mnist.py -g --communicator pure_nccl

