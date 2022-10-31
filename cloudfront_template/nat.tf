resource "aws_nat_gateway" "playground-nat" {
  allocation_id = aws_eip.nat-ip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = "playground-nat"
  }

  depends_on = [aws_internet_gateway.playground-igw]
}