# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

resource "aws_nat_gateway" "playground_nat" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = "playground-nat"
  }

  depends_on = [aws_internet_gateway.playground_igw]
}