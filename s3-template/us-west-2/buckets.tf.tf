# # new bucket
# resource "aws_s3_bucket" "xx-playground-bucket-01" {
#   bucket = "xx-playground-bucket-01"

#   tags = {
#     Name        = "Name"
#     Environment = "xx-playground-bucket-01"
#   }
# }

# resource "aws_s3_bucket_versioning" "xx-playground-bucket-01-ver" {
#   bucket = aws_s3_bucket.xx-playground-bucket-01.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }
