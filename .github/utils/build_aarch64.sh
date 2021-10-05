#!/bin/bash

# Rename/clean input variables
PYTHON_VERSION=$(echo $1 | grep -o -E '[0-9]+' | head -1)
PYTHON=$2

# Install miniconda for our platform
curl https://repo.anaconda.com/miniconda/Miniconda3-py${PYTHON_VERSION}_4.10.3-Linux-aarch64.sh -o ~/miniconda.sh
/bin/bash ~/miniconda.sh -b -p $HOME/miniconda
conda --version
