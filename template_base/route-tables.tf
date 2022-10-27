# PLAYGROUND

# public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.playground-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.playground-igw.id
  }

  tags = {
    Name = "playground-public-rt"
  }
}


# private route table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.playground-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.playground-nat.id
  }

  tags = {
    Name = "playground-private-rt"
  }
}


# public subnet associations
resource "aws_route_table_association" "public_subnet_ass" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_route_table.id

}

# private subnet associations
resource "aws_route_table_association" "private_subnet_ass" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = aws_route_table.private_route_table.id
}