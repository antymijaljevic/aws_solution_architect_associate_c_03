# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_global_table

# resource "aws_dynamodb_table" "playground_dynamo_db" {
#   provider = aws.us-east-1

#   hash_key         = "myAttribute"
#   name             = "myTable"
#   stream_enabled   = true
#   stream_view_type = "NEW_AND_OLD_IMAGES"
#   read_capacity    = 1
#   write_capacity   = 1

#   attribute {
#     name = "myAttribute"
#     type = "S"
#   }
# }