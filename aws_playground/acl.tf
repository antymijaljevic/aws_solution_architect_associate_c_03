# default acl
resource "aws_default_network_acl" "default-acl" {
  default_network_acl_id = aws_vpc.playground-vpc.default_network_acl_id

  tags = {
    Name = "default-acl"
  }
}


# playground network acl
resource "aws_network_acl" "playground-acl" {
  vpc_id     = aws_vpc.playground-vpc.id
  subnet_ids = [
    aws_subnet.private_subnets[0].id, 
    aws_subnet.private_subnets[1].id, 
    aws_subnet.private_subnets[2].id,
    aws_subnet.public_subnets[0].id,
    aws_subnet.public_subnets[1].id,
    aws_subnet.public_subnets[2].id
  ]


  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "playground-acl"
  }
}
