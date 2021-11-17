# Data sources
data "aws_vpc" "example-vpc" {
  id = var.vpc_id
}

# TFE server
resource "aws_instance" "julie-test-tfe" {
  # name = "julie-test-tfe"
  ami  = var.aws_ami
  associate_public_ip_address = true

  instance_type   = var.aws_instance_type_ec2
  security_groups = [resource.aws_security_group.julie-test-tfe-sg.id]

  depends_on = [
    aws_security_group.julie-test-tfe-sg
  ]

  tags = local.common_tags
  volume_tags = local.common_tags
}

# Security group for TFE server
resource "aws_security_group" "julie-test-tfe-sg" {
  name        = "julie-test-tfe-sg"
  description = "Allow web traffic, ssh from admin, replicated access"
  vpc_id      = data.aws_vpc.example-vpc.id

  ingress {
    cidr_blocks      = [data.aws_vpc.example-vpc.cidr_block]
    ipv6_cidr_blocks = [data.aws_vpc.example-vpc.ipv6_cidr_block]
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
  }

  ingress {
    cidr_blocks      = [data.aws_vpc.example-vpc.cidr_block]
    ipv6_cidr_blocks = [data.aws_vpc.example-vpc.ipv6_cidr_block]
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
  }

  ingress {
    cidr_blocks      = [data.aws_vpc.example-vpc.cidr_block]
    ipv6_cidr_blocks = [data.aws_vpc.example-vpc.ipv6_cidr_block]
    from_port        = 8800
    to_port          = 8800
    protocol         = "tcp"
  }

  ingress {
    cidr_blocks      = [var.admin_ipv4]
    ipv6_cidr_blocks = [var.admin_ipv6]
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = local.common_tags
}

# Public DNS record
# todo
