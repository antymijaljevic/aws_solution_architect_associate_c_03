# https://www.calculator.net/ip-subnet-calculator.html?cclass=any&csubnet=22&cip=10.0.0.0&ctype=ipv4&printit=0&x=50&y=21
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.playground_vpc.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "playground-public-subnet-${var.azs[count.index]}"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.playground_vpc.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "playground-private-subnet-${var.azs[count.index]}"
  }
}
