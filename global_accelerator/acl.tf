# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl
resource "aws_network_acl" "playground_acl" {
  vpc_id     = aws_vpc.playground_vpc.id

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

resource "aws_network_acl_association" "main" {
  network_acl_id = aws_network_acl.playground_acl.id
  subnet_id      = "${aws_subnet.public_subnets.*.id}"
}