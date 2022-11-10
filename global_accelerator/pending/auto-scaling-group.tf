resource "aws_autoscaling_group" "playground-asg" {
  name                = "playground-asg"
  desired_capacity    = 3
  max_size            = 5
  min_size            = 3
  vpc_zone_identifier = aws_subnet.public_subnets.*.id

  launch_template {
    id      = aws_launch_template.playground-lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.playground-alb-tg.arn]

  tag {
    key                 = "Name"
    value               = "playground-instance"
    propagate_at_launch = true
  }
}
