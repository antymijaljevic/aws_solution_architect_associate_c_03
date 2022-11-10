resource "aws_eip" "nat-ip" {
    vpc = true
    tags = {
        Name = "nat-ip"
    }
}

resource "aws_eip" "nlb-ip-1" {
    vpc = true

    tags = {
        Name = "nlb-ip-1"
    }
}

resource "aws_eip" "nlb-ip-2" {
    vpc = true

    tags = {
        Name = "nlb-ip-2"
    }
}

resource "aws_eip" "nlb-ip-3" {
    vpc = true

    tags = {
        Name = "nlb-ip-3"
    }
}