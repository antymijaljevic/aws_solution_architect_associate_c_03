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


# PLAYGROUND RDS SECURITY GROUP
locals {
    playground_db_sg = {
    name        = "playground-db-sg"
    description = "playground db security group"
    sg_ingress  = [aws_security_group.playground_sg.id]
  }
}

resource "aws_security_group" "playground_db_sg" {
  name        = local.playground_db_sg.name
  vpc_id      = aws_vpc.playground_vpc.id
  description = local.playground_db_sg.description

  dynamic "ingress" {
    for_each = local.playground_db_sg.sg_ingress
    iterator = sg
    content {
      protocol        = "tcp"
      from_port       = 3306
      to_port         = 3306
      security_groups = [sg.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = local.playground_db_sg.name
  }
}
