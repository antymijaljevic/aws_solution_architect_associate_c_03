resource "aws_lb_listener" "playground-public-alb-listener" {
  load_balancer_arn = aws_lb.playground-public-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.playground-alb-tg.arn
  }
}

# playground can't issue a cert for *.playground-test.com
# resource "aws_lb_listener" "playground-public-alb-listener-2" {
#   load_balancer_arn = aws_lb.playground-public-alb.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   # ssl_policy        = "ELBSecurityPolicy-2016-08"
#   # certificate_arn   = aws_acm_certificate.playground-cert.arn

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.playground-alb-tg.arn
#   }
# }


resource "aws_lb_listener" "playground-public-nlb-listener" {
  load_balancer_arn = aws_lb.playground-public-nlb.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.playground-nlb-tg.arn
  }
}