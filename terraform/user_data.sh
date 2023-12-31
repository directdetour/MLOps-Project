#!/bin/bash

# Update and install required packages
sudo apt-get update
sudo apt-get install -y git python3-pip

# Navigate to the home directory
cd ~

# Clone the GitHub repository
git clone https://github.com/directdetour/MLOps-Project.git
cd MLOps-Project

# Install pipenv and create a virtual environment
pip3 install pipenv
pipenv install

# Activate the virtual environment
source $(pipenv --venv)/bin/activate

# Install required Python packages from Pipfile
pipenv install --ignore-pipfile

# ADD LATER:
# Launch MLflow server (adjust parameters as needed)
# nohup mlflow server --host 0.0.0.0 --port 5000 &

# Connect to Prefect Cloud or start Prefect local agent (adjust as needed)
# prefect agent local start
# $ prefect config set PREFECT_API_URL="https://api.prefect.cloud/api/accounts/[ACCOUNT-ID]/workspaces/[WORKSPACE-ID]"
# $ prefect config set PREFECT_API_KEY="[API-KEY]"




# Execute your pipeline script
# python ml_pipeline.py
