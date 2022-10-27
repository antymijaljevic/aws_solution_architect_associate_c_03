# resource "aws_vpc_peering_connection" "default-to-playground-vp" {
#   peer_owner_id = "772086023877"
#   peer_vpc_id   = "vpc-05b8a28438b43f111" # Requester CIDRs default-vpc
#   vpc_id        = aws_vpc.playground-vpc.id # Accepter CIDRs playground-vpc
#   auto_accept   = true

#   tags = {
#     Name = "playground-vpc <--> default-vpc"
#   }
# }