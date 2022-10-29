
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "playground-bucket-01" {
  bucket = "playground-bucket-01"

  tags = {
    Name        = "Name"
    Environment = "playground-bucket-01"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block
resource "aws_s3_bucket_public_access_block" "playground-bucket-01-pab" {
  bucket = aws_s3_bucket.playground-bucket-01.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning
resource "aws_s3_bucket_versioning" "playground-bucket-01-ver" {
  bucket = aws_s3_bucket.playground-bucket-01.id
  versioning_configuration {
    status = "Enabled"
  }
}