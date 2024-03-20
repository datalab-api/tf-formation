terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  profile = "default"
  region  = var.aws_region
  #credentials = file("~/.aws/credentials")
}


