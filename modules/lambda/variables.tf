variable "aws_region" {
  type    = string
  default = "us-east-1" # Replace with your desired region
}

variable "function_name" {
  type = string
  default="my-lambda"
}

variable "runtime" {
  type = string
  default = "nodejs18.x"
}

variable "handler" {
  type = string
  default="index.test"
}

# S3 Bucket

variable "bucket_name" {
  type    = string
  default = "my-lambda-bucket"
}

# IAM Role and Policy

variable "role_name" {
  type = string
  default="iam_for_lambda"
}

variable "policy_document_name" {
  type = string
  default="lambda_policy"
}

variable "zip_file" {
  type = string
}

variable "timeout" {
  type    = number
  default = 300 # Set timeout in seconds (optional)
}
