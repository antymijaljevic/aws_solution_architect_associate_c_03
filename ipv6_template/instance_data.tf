data "aws_instance" "instance-data" {
  instance_id = aws_instance.web-server-1.id
}


output "whatever" {
  value = data.aws_instance.instance-data.network_interface_id
}