# Define variables for your DynamoDB deployment

variable "aws_region" {
  type    = string
  default = "us-east-1" # Replace with your desired region
}

variable "table_name" {
  type    = string
  default = "my-dynamodb-table"
}

variable "hash_key" {
  type    = string
  default = "id"
}

# Output variables (known after apply)
variable "id" {
  type    = string
  default = "testdedeploydynamodbpour-learning"
}

variable "stream_arn" {
  type    = string
  default = ""
}

variable "stream_label" {
  type    = string
  default = ""
}

variable "stream_view_type" {
  type    = string
  default = ""
}

variable "tags_all" {
  type    = map(string)
  default = {} # Empty map for tags
}

variable "read_capacity_units" {
  type    = number
  default = 5 # Adjust based on your expected read throughput
}

variable "write_capacity_units" {
  type    = number
  default = 5 # Adjust based on your expected write throughput
}
