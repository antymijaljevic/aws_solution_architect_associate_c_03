# playground security group
resource "aws_security_group" "playground-sg" {
  name        = "playground-sg"
  vpc_id      = aws_vpc.playground-vpc.id
  description = "playground security group"

  ingress {
    protocol    = -1
    self        = true
    from_port   = 0
    to_port     = 0
    description = "Group Itself"
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    description = "Web Page"
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"] # can't access when Tethering, so I am open to the world :)
    description = "SSH from home"
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS"
  }

  ingress {
    protocol    = "tcp"
    from_port   = 3389
    to_port     = 3389
    cidr_blocks = ["0.0.0.0/0"]
    description = "RDP"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "playground-sg"
  }
}



# efs
resource "aws_security_group" "efs-sg" {
  name        = "efs-sg"
  vpc_id      = aws_vpc.playground-vpc.id
  description = "nfs inbound"

  ingress {
    protocol    = -1
    self        = true
    from_port   = 0
    to_port     = 0
    description = "Group Itself"
  }

  ingress {
    protocol    = "tcp"
    from_port   = 2049
    to_port     = 2049
    security_groups = ["${aws_security_group.playground-sg.id}"]
    description = "nfs"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "efs-sg"
  }
}