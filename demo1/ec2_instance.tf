resource "aws_instance" "hashitalks-demo1" {
  ami                         = "ami-08306577a6694f5e7"
  instance_type               = "t3.micro"
  key_name                    = "hashitalks-demo"
  vpc_security_group_ids      = [aws_security_group.firstdata_dev_jump.id]
  subnet_id                   = data.terraform_remote_state.vpc.outputs.aws_subnet_firstdata_dev_jump.id
  associate_public_ip_address = true
  iam_instance_profile        = data.terraform_remote_state.iam.outputs.aws_iam_role_CloudWatchAgentServerRole.id

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 10
    delete_on_termination = true
  }

  tags = {
    Name           = "${var.client}-${var.environment}-ec2-jump"
    Client         = var.client
    Environment    = var.environment
    AWSResource    = "ec2"
    Creator        = data.aws_caller_identity.current.arn
    CreationDate   = timestamp()
    DeploymentTool = var.iac_tool
  }

  volume_tags = {
    Name           = "${var.client}-${var.environment}-ebs-jump"
    Client         = var.client
    Environment    = var.environment
    AWSResource    = "ebs"
    Creator        = data.aws_caller_identity.current.arn
    CreationDate   = timestamp()
    DeploymentTool = var.iac_tool
  }

  lifecycle {
    ignore_changes = [
      tags["CreationDate"],
      tags["Creator"],
      volume_tags["CreationDate"],
      volume_tags["Creator"]
    ]
  }
}