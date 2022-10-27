resource "aws_vpc" "playground-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "playground-vpc"
  }
}