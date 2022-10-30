# east
resource "aws_instance" "web-server-1" {
  ami                    = data.aws_ami.amazon-2-arm.id
  instance_type          = "t4g.small"
  subnet_id              = aws_subnet.public_subnets[0].id
  vpc_security_group_ids = [aws_security_group.playground-sg.id]
  key_name               = aws_key_pair.playground-key.key_name
  user_data              = file("scripts/az.sh")
  iam_instance_profile   = aws_iam_instance_profile.playground-role-profile.name


  tags = {
    Name = "web-server-1"
  }
}

# west
resource "aws_instance" "web-server-3" {
  ami                    = data.aws_ami.amazon-2-arm-west.id
  subnet_id              = "subnet-0855ab1d3db1a7290"
  instance_type          = "t4g.small"
  vpc_security_group_ids = ["sg-015338fd309c914d2"]
  user_data              = file("scripts/az.sh")
  provider               = aws.aws_west

  tags = {
    Name = "web-server-3"
  }
}