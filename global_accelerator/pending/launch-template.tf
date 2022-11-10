resource "aws_launch_template" "playground-lt" {
  name                   = "playground-lt"
  image_id               = "ami-0636eac5d73e0e5d7"
  instance_type          = "t4g.small"
  key_name               = "playground-key"
  vpc_security_group_ids = [aws_security_group.playground-sg.id]

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = 30
      volume_type           = "gp3"
      encrypted             = true
      iops                  = 3000
      delete_on_termination = true
    }
  }

  monitoring {
    enabled = true
  }

  update_default_version = true

  user_data = filebase64("bootstrap/script-1.sh")
}
