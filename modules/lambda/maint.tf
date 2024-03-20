# Create S3 Bucket
resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.bucket_name
  acl    = "private" # adjust ACL as needed
}

# Create IAM Role
resource "aws_iam_role" "lambda_role" {
  name               = var.role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Create IAM Policy Document with S3 bucket access
resource "aws_iam_policy_document" "lambda_policy" {
  name = var.policy_document_name

  statement {
    effect    = "Allow"
    actions   = ["s3:GetObject", "s3:PutObject"]         # Adjust actions as needed
    resources = [aws_s3_bucket.lambda_bucket.arn + "/*"] # Use bucket ARN
  }
}

# Attach policy to role
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy_document.lambda_policy.arn
}

# Create Lambda function resource
resource "aws_lambda_function" "my_lambda" {
  function_name = var.function_name
  runtime       = var.runtime
  role          = aws_iam_role.lambda_role.arn
  handler       = var.handler
  timeout       = var.timeout

  # Package type (Zip or Image) based on your deployment method
  package_type = "Zip" # Change to "Image" if using container image

  # Code configuration (Zip file path or container image URI)
  code {
    zip_file = var.zip_file
  }
}
