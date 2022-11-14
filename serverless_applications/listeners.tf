# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener

resource "aws_lb_listener" "playground_public_alb_listener" {
  load_balancer_arn = aws_lb.playground_public_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.playground_default_alb_tg.arn
  }
}
