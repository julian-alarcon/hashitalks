// main.tf
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = "~> 0.13.0"
}

provider "aws" {
  region                  = var.aws_region
  version                 = "~> 3.2"
  shared_credentials_file = var.aws_credentials_file
}
