# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role

resource "aws_lb" "playground_public_alb" {
  name               = "playground-public-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.playground_sg.id]
  subnets            = [for subnet in aws_subnet.public_subnets : subnet.id]

  tags = {
    Name = "playground-public-alb"
  }
}