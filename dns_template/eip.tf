resource "aws_eip" "nat-ip" {
    vpc = true
    tags = {
        Name = "nat-ip"
    }
}