output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.new_instance.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.new_instance.public_ip
}

output "instance_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.new_instance.public_dns
}

output "private_key_pem" {
  value = tls_private_key.my_keypair.private_key_pem
  sensitive = true
}