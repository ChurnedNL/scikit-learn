#!/usr/bin/env bash

# Install miniconda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

conda create -n sklearn-dev -c conda-forge numpy scipy cython joblib threadpoolctl pytest compilers
conda activate sklearn-dev
python setup.py sdist bdist_wheel

# twine upload
