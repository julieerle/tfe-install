locals {
  owner                 = "julie.erlemeier@hashicorp.com"
  team                  = "terraform-cli-support"
  managedBy             = "terraform"
  backend_tfc_workspace = "julieerle-test-workspace"

  common_tags = {
    owner                 = local.owner
    team                  = local.team
    managedBy             = local.managedBy
    backend_tfc_workspace = local.backend_tfc_workspace
  }
}

variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "aws_ami" {
  description = "AMI id for Amazon Linux in us-west-2"
  type        = string
  default     = "ami-00be885d550dcee43"
}

variable "aws_instance_type_ec2" {
  type    = string
  default = "m5.xlarge"
}

variable "aws_instance_type_rds" {
  type    = string
  default = "db.m4.xlarge"
}

variable "vpc_id" {
  type    = string
  default = "vpc-012b2515199ccd7a8"
}

variable "subnet_id" {
  type    = string
  default = "subnet-062b85c42832e807c"
}

variable "admin_ipv4" {
  type    = string
  default = "67.183.118.8"
}

variable "admin_ipv6" {
  type    = string
  default = "2601:602:8480:40a0:746e:edb8:13a9:e136"
}
