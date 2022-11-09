# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system
resource "aws_efs_file_system" "playground-efs" {
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = true

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  tags = {
    Name = "playground-efs"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target
resource "aws_efs_mount_target" "playground-efs-mt" {
  file_system_id  = aws_efs_file_system.playground-efs.id
  subnet_id       = aws_subnet.public_subnets[0].id
  security_groups = [aws_security_group.efs-sg.id]
}

resource "aws_efs_mount_target" "playground-efs-mt-1" {
  file_system_id  = aws_efs_file_system.playground-efs.id
  subnet_id       = aws_subnet.public_subnets[1].id
  security_groups = [aws_security_group.efs-sg.id]
}

# sudo mkdir efs
# sudo yum install -y amazon-efs-utils -y
# sudo mount -t efs fs-091d201dd56e46e2c efs/