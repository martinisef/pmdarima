#!/bin/bash

# Rename/clean input variables
PYTHON_VERSION=$(echo $1 | awk -F'[^0-9]+' '{ print $2 }')
PYTHON=$2

# Install miniconda for our platform
curl -s https://repo.anaconda.com/miniconda/Miniconda3-py${PYTHON_VER}_4.10.3-Linux-aarch64.sh | /bin/bash
conda --version
