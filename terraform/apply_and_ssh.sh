#!/bin/bash

# Apply the Terraform configuration
terraform apply -auto-approve

# Retrieve instance public IP and private key
INSTANCE_DNS=$(terraform output -raw instance_public_dns)
PRIVATE_KEY=$(terraform output -raw private_key_pem)

# Save private key to a file
rm -f ops_private_key.pem
echo "$PRIVATE_KEY" > ops_private_key.pem
echo "key file generated!"
chmod 400 ops_private_key.pem

# SSH into the instance
ssh -i ops_private_key.pem ubuntu@$INSTANCE_DNS
