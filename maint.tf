# resource "aws_vpc" "my_vpc" {
#   cidr_block = "10.0.0.0/16"
#   instance_tenancy = "default"
#   enable_dns_hostnames = true
#   enable_dns_support = true
# }

module "vpc" {
  source = "github.com/terrablocks/aws-vpc.git"

  network_name = "dev"
}

module "my_subnet" {
  source = "github.com/terrablocks/aws-subnets.git"

  vpc_id = module.vpc.id
  cidr_blocks = {
    us-east-1a = "10.0.1.0/24"
    us-east-1b = "10.0.2.0/24"
    us-east-1c = "10.0.3.0/24"
  }
  subnet_name   = "public-subnet"
  map_public_ip = true
  rtb_name      = "public-rtb"
  attach_igw    = true
}



resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "Allow inbound traffic on port 22 and 80"

  vpc_id = "vpc-0aeaf3838bc785d44"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_block
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.http_cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  #subnet_id     = "subnet-0369243fcd51a3963"
  security_groups = [aws_security_group.my_security_group.name]

  tags = {
    Name = "MyEC2Instance"
  }
}
