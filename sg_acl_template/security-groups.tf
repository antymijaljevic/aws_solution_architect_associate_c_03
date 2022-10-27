# playground security group
resource "aws_security_group" "playground-sg" {
  name        = "playground-sg"
  vpc_id      = aws_vpc.playground-vpc.id
  description = "playground security group"

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


resource "aws_security_group" "private-app-sg" {
  name        = "private-app-sg"
  vpc_id      = aws_vpc.playground-vpc.id
  description = "private-app-sg"

  ingress {
    protocol        = "tcp"
    from_port       = 80
    to_port         = 80
    description     = "Web Server"
    security_groups = ["${aws_security_group.playground-sg.id}"]
  }

  tags = {
    Name = "private-app-sg"
  }
}
