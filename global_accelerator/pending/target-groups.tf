resource "aws_lb_target_group" "playground-alb-tg" {
  name        = "playground-alb-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.playground-vpc.id

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/"
    matcher             = "200"
  }
}

resource "aws_lb_target_group" "playground-alb-2-tg" {
  name        = "playground-alb-2-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.playground-vpc.id

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/"
    matcher             = "200"
  }
}

resource "aws_lb_target_group" "playground-nlb-tg" {
  name        = "playground-nlb-tg"
  target_type = "instance"
  port        = 80
  protocol    = "TCP"
  vpc_id      = aws_vpc.playground-vpc.id

  health_check {
    healthy_threshold = 3
    interval          = 30
    path              = "/"
  }
}


