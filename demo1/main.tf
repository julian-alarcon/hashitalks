terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    encrypt        = true
    bucket         = "hashitalks"
    dynamodb_table = "hashitalks"
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
