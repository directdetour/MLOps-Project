#!/bin/bash

# Retrieve instance public IP and private key
INSTANCE_IP=$(terraform output -raw instance_public_ip)
INSTANCE_DNS=$(terraform output -raw instance_public_dns)
PRIVATE_KEY=$(terraform output -raw private_key_pem)

echo "Public IP: $INSTANCE_IP"
echo "MLFlow: http://$INSTANCE_IP:5000"


# SSH into the instance
ssh -i ops_private_key.pem -o StrictHostKeyChecking=no ubuntu@$INSTANCE_DNS
