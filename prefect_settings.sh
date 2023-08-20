#!/bin/bash

# Helper script to set necessary environment variables to be passed into terraformed resources.

# Prompt the user to enter values for the environment variables
read -p "Enter the value for PREFECT_API_KEY: " prefect_api_key
read -p "Enter the value for PREFECT_API_URL: " prefect_api_url

# Check if the entered values are non-empty strings before setting the variables
if [[ -n "$prefect_api_key" ]]; then
  export PREFECT_API_KEY="$prefect_api_key"
  echo "PREFECT_API_KEY set to: $PREFECT_API_KEY"
fi

if [[ -n "$prefect_api_url" ]]; then
  export PREFECT_API_URL="$prefect_api_url"
  echo "PREFECT_API_URL set to: $PREFECT_API_URL"
fi