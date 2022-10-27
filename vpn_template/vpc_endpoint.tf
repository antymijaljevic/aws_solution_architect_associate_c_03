# Gateway endpoint for S3
resource "aws_vpc_endpoint" "s3-endpoint" {
  vpc_id       = aws_vpc.playground-vpc.id
  service_name = "com.amazonaws.us-east-1.s3"
  tags = {
    Name = "s3-endpoint"
  }
}

resource "aws_vpc_endpoint_route_table_association" "s3-endpoint-ass" {
  route_table_id  = "rtb-023575260040d6d56"
  vpc_endpoint_id = aws_vpc_endpoint.s3-endpoint.id
}