#  Configure Terraform
terraform {
  required_version = ">= 0.14.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.64.2"
    }
  }
}

# Configure provider
provider "aws" {
    region = var.aws_region
}
