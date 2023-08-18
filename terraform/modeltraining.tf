resource "aws_instance" "new_instance" {
  ami = "ami-007855ac798b5175e"
  instance_type = "t2.xlarge"
  tags = { Name = "mlops-zoomcamp" }
}
