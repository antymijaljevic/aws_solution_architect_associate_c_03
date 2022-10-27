resource "aws_lb" "playground-public-alb" {
  name               = "playground-public-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.playground-sg.id]
  subnets            = [for subnet in aws_subnet.public_subnets : subnet.id]

  tags = {
    Name = "playground-public-alb"
  }
}