#!/bin/bash

# Apply the Terraform configuration
terraform apply -auto-approve

# Retrieve instance public IP and private key
INSTANCE_IP=$(terraform output -raw instance_public_ip)
INSTANCE_DNS=$(terraform output -raw instance_public_dns)
PRIVATE_KEY=$(terraform output -raw private_key_pem)

# Save private key to a file
rm -f ops_private_key.pem
echo "$PRIVATE_KEY" > ops_private_key.pem
chmod 400 ops_private_key.pem

echo "Public IP: $INSTANCE_IP"
echo "MLFlow: http://$INSTANCE_IP:5000"
echo "Allow 2-3 minutes for EC2 to initialize"

# Wait for 10 seconds
sleep 10

# SSH into the instance
ssh -i ops_private_key.pem -o StrictHostKeyChecking=no ubuntu@$INSTANCE_DNS
