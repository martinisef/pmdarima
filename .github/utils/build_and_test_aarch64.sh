#!/bin/bash

PYTHON_VERSION=$1

# Create env
conda create --name build-env --python=$PYTHON_VERSION -y
conda activate build-env

# Install requirements
conda install --file build_tools/build_requirements.txt
conda install --freeze-installed --file requirements.txt

# Create wheel
python setup.py bdist_wheel

# Install and test
pip install --pre --no-index --find-links dist/ pmdarima
python -m pytest --showlocals --durations=20 --pyargs pmdarima --benchmark-skip
