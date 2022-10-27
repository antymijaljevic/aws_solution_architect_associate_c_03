resource "aws_internet_gateway" "playground-igw" {
  vpc_id = aws_vpc.playground-vpc.id

  tags = {
    Name = "playground-igw"
  }
}