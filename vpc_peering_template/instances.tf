resource "aws_instance" "web-server-1" {
  ami                    = data.aws_ami.amazon-2-arm.id
  instance_type          = "t4g.small"
  subnet_id              = aws_subnet.public_subnets[0].id
  vpc_security_group_ids = [aws_security_group.playground-sg.id]
  key_name               = aws_key_pair.playground-key.key_name
  user_data              = file("scripts/subnet_id.sh")
  user_data_replace_on_change = true # if script changes, recreate instance

  tags = {
    Name = "web-server-1"
  }
}

resource "aws_instance" "web-server-2" {
  ami                    = data.aws_ami.amazon-2-arm.id
  instance_type          = "t4g.small"
  subnet_id              = aws_subnet.private_subnets[0].id
  vpc_security_group_ids = [aws_security_group.private-app-sg.id]
  key_name               = aws_key_pair.playground-key.key_name
  user_data              = file("scripts/subnet_id.sh")
  user_data_replace_on_change = true

  tags = {
    Name = "web-server-2"
  }
}

#default vpc
# resource "aws_instance" "default-web-server-1" {
#   ami                    = data.aws_ami.amazon-2-arm.id
#   instance_type          = "t4g.small"
#   subnet_id              = "subnet-077e22d97f8aae457"
#   vpc_security_group_ids = ["sg-09281bc7a3b0f6805"]
#   key_name               = aws_key_pair.playground-key.key_name
#   user_data              = file("scripts/subnet_id.sh")
#   user_data_replace_on_change = true # if script changes, recreate instance

#   tags = {
#     Name = "default-web-server-1"
#   }
# }