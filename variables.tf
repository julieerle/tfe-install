variable "aws_region" {
    type = string
    default = "us-west-2"
}

variable "aws_ami" {
    type = string
    default = "ami-00be885d550dcee43"
}

variable "aws_instance_type_ec2" {
    type = string
    default = "m5.xlarge"
}

variable "aws_instance_type_rds" {
    type = string
    default = "value"
}
