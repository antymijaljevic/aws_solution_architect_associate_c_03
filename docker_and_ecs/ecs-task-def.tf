# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition

resource "aws_ecs_task_definition" "windows_task" {
  family                   = "Windows-Task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "iis",
    "image": "mcr.microsoft.com/windows/servercore/iis",
    "cpu": 1024,
    "memory": 2048,
    "essential": true
  }
]
TASK_DEFINITION

  runtime_platform {
    operating_system_family = "WINDOWS_SERVER_2019_CORE"
    cpu_architecture        = "X86_64"
  }
}


resource "aws_ecs_task_definition" "nginx_task" {
  family = "Nginx-Task"
  network_mode = "awsvpc"
  container_definitions = jsonencode([
    {
      name      = "Nginx-Container"
      image     = "nginx:latest"
      cpu       = 1024
      memory    = 900
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

resource "aws_ecs_task_definition" "httpd_task" {
  family = "Httpd-Task"
  network_mode = "bridge"
  container_definitions = jsonencode([
    {
      name      = "Httpd-Container"
      image     = "httpd:2.4"
      cpu       = 500
      memory    = 500
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

