variable "aws_credentials_file" {
  type        = string
  description = "Credentials to use for accessing AWS"
  default     = "~/.aws/credentials"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Demo1"
  default     = "demo1"
}
