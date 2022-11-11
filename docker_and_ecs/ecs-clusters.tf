# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster

resource "aws_ecs_cluster" "fargate_cluster" {
  name = "Fargate-Cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}