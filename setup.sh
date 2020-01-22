#!/bin/sh

module load chainer/7.0.0

MYDIR=/lustre/${GROUP}/${USER}
export HOME=$MYDIR
export PYTHONUSERBASE=$MYDIR/.python

#install mpi4py
pip install --user mpi4py

#download mnist data 
python -c "import chainer; chainer.datasets.get_mnist()"

#download train_mnist.py for chainermn
wget https://raw.githubusercontent.com/chainer/chainer/v7.0.0/examples/chainermn/mnist/train_mnist.py
