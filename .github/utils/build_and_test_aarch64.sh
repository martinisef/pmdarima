#!/bin/bash

PYTHON_VERSION=$1

# Init our shell
conda init bash
source ~/.bashrc

# Create env
conda create -y --name build-env python=$PYTHON_VERSION
conda activate build-env

# Install statsmodels from conda
conda install -c conda-forge --no-deps $(cat build_tools/build_requirements.txt | grep statsmodels)

# Install everything else from pip
for requirement in $(grep -v statsmodels build_tools/build_requirements.txt); do
  pip install "$requirement"
done

for requirement in $(grep -v statsmodels requirements.txt); do
  pip install "$requirement"
done