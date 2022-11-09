resource "aws_instance" "web-server-1" {
  ami                         = data.aws_ami.amazon-2-arm.id
  instance_type               = "t4g.small"
  subnet_id                   = aws_subnet.public_subnets[0].id
  vpc_security_group_ids      = [aws_security_group.playground-sg.id]
  key_name                    = aws_key_pair.playground-key.key_name
  user_data                   = file("scripts/subnet_id.sh")
  user_data_replace_on_change = true
#   iam_instance_profile        = aws_iam_instance_profile.playground-role-profile.name


  tags = {
    Name = "web-server-1"
  }
}

resource "aws_instance" "web-server-2" {
  ami                         = data.aws_ami.amazon-2-arm.id
  instance_type               = "t4g.small"
  subnet_id                   = aws_subnet.public_subnets[1].id
  vpc_security_group_ids      = [aws_security_group.playground-sg.id]
  key_name                    = aws_key_pair.playground-key.key_name
  user_data                   = file("scripts/subnet_id.sh")
  user_data_replace_on_change = true
#   iam_instance_profile        = aws_iam_instance_profile.playground-role-profile.name


  tags = {
    Name = "web-server-2"
  }
}



# resource "aws_instance" "web-server-2" {
#   ami                         = data.aws_ami.amazon-2-arm.id
#   instance_type               = "t4g.small"
#   subnet_id                   = aws_subnet.private_subnets[0].id
#   vpc_security_group_ids      = [aws_security_group.playground-sg.id]
#   key_name                    = aws_key_pair.playground-key.key_name
#   user_data                   = file("scripts/subnet_id.sh")
#   user_data_replace_on_change = true
#   iam_instance_profile        = aws_iam_instance_profile.playground-role-profile.name

#   tags = {
#     Name = "web-server-2"
#   }
# }

# resource "aws_instance" "web-server-3" {
#   ami                         = data.aws_ami.win-server-2022-x86.id
#   instance_type               = "t2.micro"
#   subnet_id                   = aws_subnet.public_subnets[0].id
#   vpc_security_group_ids      = [aws_security_group.playground-sg.id]
#   key_name                    = aws_key_pair.playground-key.key_name
#   user_data                   = file("scripts/subnet_id.sh")
#   user_data_replace_on_change = true
#   iam_instance_profile        = aws_iam_instance_profile.playground-role-profile.name


#   tags = {
#     Name = "web-server-3"
#   }
# }

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ami_from_instance
# resource "aws_ami_from_instance" "web-server-30-ami" {
#   name               = "web-server-30-ami"
#   source_instance_id = aws_instance.web-server-3.id
# }
