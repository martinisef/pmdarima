#!/bin/bash

PYTHON_VERSION=$1

# Make sure we have gcc installed
apt-get update
apt-get install -y build-essential

# Init our shell
conda init bash

# Create env
conda create -y --name build-env python=$PYTHON_VERSION
conda activate build-env

# Install requirements
conda config --add channels conda-forge
conda install -y --file build_tools/build_requirements.txt
conda install -y --freeze-installed --file requirements.txt

# Create wheel
python setup.py bdist_wheel

# Install and test
pip install --pre --no-index --find-links dist/ pmdarima
python -m pytest --showlocals --durations=20 --pyargs pmdarima --benchmark-skip
