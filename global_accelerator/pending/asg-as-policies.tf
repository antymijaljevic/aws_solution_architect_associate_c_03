# As required to maintain Average CPU utilization at 50. Add or remove capacity units as required
# resource "aws_autoscaling_policy" "playground-asg-scale-up-policy" {
#   name                   = "playground-asg-scale-up-policy"
#   policy_type            = "TargetTrackingScaling"
#   estimated_instance_warmup = 100
#   autoscaling_group_name = aws_autoscaling_group.playground-asg.name

#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageCPUUtilization"
#     }

#     target_value              = 10.0
#   }
# }