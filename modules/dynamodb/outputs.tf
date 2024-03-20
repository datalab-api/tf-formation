# Define outputs for the DynamoDB table name and ARN
output "dynamodb_table_name" {
  value = aws_dynamodb_table.my_table.name
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.my_table.arn
}
