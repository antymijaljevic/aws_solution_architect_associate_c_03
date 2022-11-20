# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group

resource "aws_db_subnet_group" "playground_db_subnet_group" {
  name       = "playground-db-subnet-group"
  subnet_ids = [for subnet in aws_subnet.private_subnets : subnet.id]

  tags = {
    Name = "playground-db-subnet-group"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance

# resource "aws_db_instance" "playground_db" {
#   identifier              = "playground-db"
#   db_subnet_group_name    = aws_db_subnet_group.playground_db_subnet_group.name
#   allocated_storage       = 20
#   max_allocated_storage   = 1000
#   storage_type            = "gp2"
#   db_name                 = "database1"
#   engine                  = "mysql"
#   engine_version          = "8.0"
#   instance_class          = "db.t2.micro"
#   username                = "admin12345"
#   password                = "admin12345"
#   publicly_accessible     = false
#   port                    = 3306
#   backup_retention_period = 7
#   deletion_protection     = true
#   vpc_security_group_ids  = [aws_security_group.playground_db_sg.id]
#   multi_az = true
# }
