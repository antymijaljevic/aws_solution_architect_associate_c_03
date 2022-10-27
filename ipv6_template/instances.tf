resource "aws_instance" "web-server-1" {
  ami                    = data.aws_ami.amazon-2-arm.id
  instance_type          = "t4g.small"
  subnet_id              = aws_subnet.public_subnets[0].id
  vpc_security_group_ids = [aws_security_group.playground-sg.id]
  key_name               = aws_key_pair.playground-key.key_name
  user_data              = file("scripts/subnet_id.sh")
  iam_instance_profile   = aws_iam_instance_profile.playground-role-profile.name
  # Network interfaces > instance_id > flow_logs > create_flow_logs

  tags = {
    Name = "web-server-1"
  }
}

resource "aws_instance" "web-server-2" {
  ami                    = data.aws_ami.amazon-2-arm.id
  instance_type          = "t4g.small"
  subnet_id              = aws_subnet.private_subnets[0].id
  vpc_security_group_ids = [aws_security_group.playground-sg.id]
  key_name               = aws_key_pair.playground-key.key_name
  user_data              = file("scripts/subnet_id.sh")
  iam_instance_profile   = aws_iam_instance_profile.playground-role-profile.name

  tags = {
    Name = "web-server-2"
  }
}
