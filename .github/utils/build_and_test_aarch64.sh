#!/bin/bash

PYTHON_VERSION=$1

# Make sure we have gcc installed
apt-get update
apt-get install -y build-essential python-dev

# Init our shell
conda init bash
source ~/.bashrc

# Create env
conda create -y --name build-env python=$PYTHON_VERSION
conda activate build-env

# Install statsmodels from conda
conda install -c conda-forge $(cat build_tools/build_requirements.txt | grep statsmodels)
