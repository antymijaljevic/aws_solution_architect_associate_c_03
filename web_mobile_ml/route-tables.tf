# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.playground_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.playground_igw.id
  }

  tags = {
    Name = "playground-public-rt"
  }
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.playground_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.playground_nat.id
  }

  tags = {
    Name = "playground-private-rt"
  }
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

resource "aws_route_table_association" "public_subnet_ass" {
  count = length(var.public_subnet_cidrs)
  subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_route_table.id

}

resource "aws_route_table_association" "private_subnet_ass" {
  count = length(var.private_subnet_cidrs)
  subnet_id = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = aws_route_table.private_route_table.id
}