# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ebs_volume
# resource "aws_ebs_volume" "volume-1" {
#   availability_zone = var.azs[0]
#   size              = 100
#   type              = "gp2"

#   tags = {
#     Name = "volume-1"
#   }
# }

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment
# resource "aws_volume_attachment" "volume-1-att" {
#   device_name = "/dev/sdh"
#   volume_id   = aws_ebs_volume.volume-1.id
#   instance_id = aws_instance.web-server-3.id
# }

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_snapshot
# resource "aws_ebs_snapshot" "volume-1-copy" {
#   volume_id = aws_ebs_volume.volume-1.id

#   tags = {
#     Name = "volume-1-copy"
#   }
# }