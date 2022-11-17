# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

resource "aws_eip" "nat_ip" {
    vpc = true
    tags = {
        Name = "nat-ip"
    }
}