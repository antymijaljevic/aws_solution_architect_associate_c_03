
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "origin-1-bucket-n1" {
  bucket = "origin-1-bucket-n1"

  tags = {
    Name        = "Name"
    Environment = "origin-1-bucket-n1"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block
resource "aws_s3_bucket_public_access_block" "origin-1-bucket-n1-pab" {
  bucket = aws_s3_bucket.origin-1-bucket-n1.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning
resource "aws_s3_bucket_versioning" "origin-1-bucket-n1-ver" {
  bucket = aws_s3_bucket.origin-1-bucket-n1.id
  versioning_configuration {
    status = "Enabled"
  }
}





# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "origin-2-bucket-n2" {
  bucket = "origin-2-bucket-n2"
  provider = aws.aws_west
  
  tags = {
    Name        = "Name"
    Environment = "origin-2-bucket-n2"
  }
}