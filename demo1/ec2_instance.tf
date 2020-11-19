// ec2_instance.tf
resource "aws_instance" "hashitalks_demo_01" {
  ami                         = "ami-08306577a6694f5e7"
  instance_type               = "t3.micro"
  key_name                    = "hashitalks-demo"
  vpc_security_group_ids      = ["sg-02b890655cf1e047a"]
  subnet_id                   = "subnet-0981ff2ea02e6b78d"
}


/*
terraform plan
terraform apply
aws ec2 describe-instances
terraform import aws_instance.hashitalks_demo_01 i-0b6a9577eeaadd90b
terraform plan

-- Add additional info
terraform plan

terraform apply
*/
