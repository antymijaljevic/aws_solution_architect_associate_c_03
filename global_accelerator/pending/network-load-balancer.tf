resource "aws_lb" "playground-public-nlb" {
  name               = "playground-public-nlb"
  internal           = false
  load_balancer_type = "network"

  subnet_mapping {
    subnet_id     = aws_subnet.public_subnets[0].id
    allocation_id = aws_eip.nlb-ip-1.id
  }

  subnet_mapping {
    subnet_id     = aws_subnet.public_subnets[1].id
    allocation_id = aws_eip.nlb-ip-2.id
  }

  subnet_mapping {
    subnet_id     = aws_subnet.public_subnets[2].id
    allocation_id = aws_eip.nlb-ip-3.id
  }

  tags = {
    Name = "playground-public-nlb"
  }
}