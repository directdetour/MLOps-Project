provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

provider "tls" {}

resource "tls_private_key" "my_keypair" {
  algorithm = "RSA"
}

resource "aws_key_pair" "my_keypair" {
  key_name   = "my-keypair"
  public_key = tls_private_key.my_keypair.public_key_openssh
}

resource "aws_security_group" "instance_security_group" {
  name_prefix = "instance-sg-"
}

resource "aws_security_group_rule" "allow_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # Adjust this to restrict the IP range if needed
  security_group_id = aws_security_group.instance_security_group.id
}

resource "aws_security_group_rule" "allow_git_clone" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # Adjust this to restrict the IP range if needed
  security_group_id = aws_security_group.instance_security_group.id
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.instance_security_group.id
}

data "template_file" "user_data" {
  template = file("user_data.tpl")
  vars = {
    PREFECT_API_URL = var.PREFECT_API_URL
    PREFECT_API_KEY = var.PREFECT_API_KEY
  }
}

resource "aws_instance" "new_instance" {
  ami           = "ami-007855ac798b5175e"
  instance_type = "t2.xlarge"
  key_name      = aws_key_pair.my_keypair.key_name  # Associate the key pair

  vpc_security_group_ids = [aws_security_group.instance_security_group.id]  # Associate the security group

  tags = { Name = "mlops-zoomcamp-terraformed" }

  user_data = data.template_file.user_data.rendered
}
