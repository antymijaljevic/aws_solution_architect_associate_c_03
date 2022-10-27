
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "default-playground-bucket" {
  bucket = "default-playground-bucket"

  tags = {
    Name        = "Name"
    Environment = "default-playground-bucket"
  }
}