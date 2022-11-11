# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "public_server_1" {
  ami                    = data.aws_ami.amazon_2_arm_ami.id
  instance_type          = "t4g.small"
  subnet_id              = aws_subnet.public_subnets[0].id
  vpc_security_group_ids = [aws_security_group.playground_sg.id]
  key_name               = aws_key_pair.playground_key.key_name
  user_data              = file("user-data/script_1.sh")
  user_data_replace_on_change = true
  iam_instance_profile   = aws_iam_instance_profile.playground_role_profile.name

  tags = {
    Name = "public-server-1"
  }
}

resource "aws_instance" "private_server_2" {
  ami                    = data.aws_ami.amazon_2_arm_ami.id
  instance_type          = "t4g.small"
  subnet_id              = aws_subnet.private_subnets[0].id
  vpc_security_group_ids = [aws_security_group.playground_sg.id]
  key_name               = aws_key_pair.playground_key.key_name
  user_data              = file("user-data/script_1.sh")
  user_data_replace_on_change = true
  iam_instance_profile   = aws_iam_instance_profile.playground_role_profile.name

  tags = {
    Name = "private-server-1"
  }
}