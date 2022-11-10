resource "aws_lb_listener_rule" "public-alb-rule-1" {
  listener_arn = aws_lb_listener.playground-public-alb-listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.playground-alb-tg.arn
  }

  condition {
    query_string {
      key   = "AppGroup"
      value = "A"
    }
  }
}


resource "aws_lb_listener_rule" "public-alb-rule-2" {
  listener_arn = aws_lb_listener.playground-public-alb-listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.playground-alb-2-tg.arn
  }

  condition {
    query_string {
      key   = "AppGroup"
      value = "B"
    }
  }
}