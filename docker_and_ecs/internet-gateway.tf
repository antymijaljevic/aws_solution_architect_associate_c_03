# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

resource "aws_internet_gateway" "playground_igw" {
  vpc_id = aws_vpc.playground_vpc.id

  tags = {
    Name = "playground-igw"
  }
}