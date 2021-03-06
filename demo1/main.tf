terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    encrypt        = true
    bucket         = "hashitalks-demo-terraform-state"
    dynamodb_table = "hashitalks-demo-terraform-state-lock"
    region         = "us-east-1"
    key            = "demo1/terraform.tfstate"
  }
  required_version = "~> 0.13.0"
}

provider "aws" {
  region                  = var.aws_region
  version                 = "~> 3.2"
  shared_credentials_file = var.aws_credentials_file
}
