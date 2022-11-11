# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

resource "aws_security_group" "playground_sg" {
  name        = var.playground_sg["name"]
  vpc_id      = aws_vpc.playground_vpc.id
  description = var.playground_sg["description"]

  ingress {
    protocol    = -1
    self        = true
    from_port   = 0
    to_port     = 0
    description = "Group Itself"
  }

  dynamic "ingress" {
    for_each = var.playground_sg.ports_ingress
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # dynamic "egress" {
  #   for_each = var.playground_sg.ports_egress
  #   content {
  #     from_port   = port.value
  #     to_port     = port.value
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }
  # }

  tags = {
    Name = var.playground_sg["name"]
  }
}