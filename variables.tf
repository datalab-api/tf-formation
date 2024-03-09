variable "aws_region" {
  description = "The AWS region where resources will be provisioned."
  type        = string
  default     = "us-east-1"
}

variable "instance_ami" {
  description = "The ID of the AMI to use for the EC2 instance."
  type        = string
  default     = "ami-0440d3b780d96b29d"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
  default     = "t2.micro"
}

variable "subnet_cidr_block" {
  type        = string
  default     = null
  description = "Base CIDR block which is divided into subnet CIDR blocks (e.g. `10.0.0.0/16`)."
}

variable "ssh_cidr_block" {
  description = "CIDR block to allow SSH access."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "http_cidr_block" {
  description = "CIDR block to allow HTTP access."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
