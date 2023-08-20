#!/bin/bash

docker run --restart always -itd --name mlflow -p 5000:5000 -v ~/mlflow:/mlflow ghcr.io/mlflow/mlflow mlflow server -h 0.0.0.0

# Install pipenv and create a virtual environment
sudo -H pip3 install -U pipenv
pipenv install

# Activate the virtual environment
source $(pipenv --venv)/bin/activate

# Install required Python packages from Pipfile
pipenv install --ignore-pipfile

# Execute your pipeline script
python ml_pipeline.py

