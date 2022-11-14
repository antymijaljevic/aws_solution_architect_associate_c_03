# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service

# resource "aws_ecs_service" "mongo" {
#   name            = "mongodb"
#   cluster         = aws_ecs_cluster.foo.id
#   task_definition = aws_ecs_task_definition.httpd_task.arn
#   desired_count   = 1
#   depends_on      = [aws_iam_role_policy.foo]

#   load_balancer {
#     target_group_arn = aws_lb_target_group.foo.arn
#     container_name   = "mongo"
#     container_port   = 8080
#   }
# }