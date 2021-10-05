#!/bin/bash

# Rename/clean input variables
echo "$@"
PYTHON_VERSION=$(echo $1 | grep -o -E '[0-9]+' | head -1)
echo "PYTHON_VERSION=${PYTHON_VERSION}"
PYTHON=$2
echo "PYTHON=${PYTHON}"

# Install miniconda for our platform
curl -s https://repo.anaconda.com/miniconda/Miniconda3-py${PYTHON_VER}_4.10.3-Linux-aarch64.sh | /bin/bash
conda --version
