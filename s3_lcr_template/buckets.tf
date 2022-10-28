
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


resource "aws_s3_bucket_lifecycle_configuration" "playground-lcr" {
  bucket = aws_s3_bucket.playground-bucket-01.bucket

  rule {
    id = "store-current-version"

    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 90
      storage_class = "GLACIER_IR"
    }
  }
}


# encryption
resource "aws_s3_bucket" "playground-bucket-02" {
  bucket = "playground-bucket-02"

  tags = {
    Name        = "Name"
    Environment = "playground-bucket-02"
  }
}

resource "aws_s3_bucket_policy" "deny-unencrypted" {
  bucket = aws_s3_bucket.playground-bucket-02.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Id": "PutObjPolicy",
    "Statement": [
        {
            "Sid": "DenyUnEncryptedObjectUploads",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::playground-bucket-02/*",
            "Condition": {
                "Null": {
                    "s3:x-amz-server-side-encryption": "true"
                }
            }
        }
    ]
}
EOF
}