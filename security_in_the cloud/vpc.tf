# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "playground_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  

  tags = {
    Name = "playground-vpc"
  }
}