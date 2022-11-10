# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule

resource "aws_lb_listener_rule" "playground_public_alb_rule_1" {
  listener_arn = aws_lb_listener.playground_public_alb_listener.arn
  priority     = 1

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.playground_default_alb_tg.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
}
