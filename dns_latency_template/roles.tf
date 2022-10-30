# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_role

resource "aws_iam_role" "playground-role" {
  name = "playground-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "playground-role"
  }
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile

resource "aws_iam_instance_profile" "playground-role-profile" {
  name = "playground-role-profile"
  role = aws_iam_role.playground-role.name
}
