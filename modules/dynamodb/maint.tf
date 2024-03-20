
# DynamoDB table resource
resource "aws_dynamodb_table" "my_table" {
  name         = var.table_name
  hash_key     = var.hash_key
  billing_mode = "PROVISIONED" # Or "PAY_PER_REQUEST"

  attribute {
    name = var.hash_key
    type = "S" # String data type for the hash key
  }

  # Adjust read capacity units based on your needs

  read_capacity  = var.read_capacity_units
  write_capacity = var.write_capacity_units

}
