# latency-based routing
resource "aws_route53_record" "a-east-record" {
  zone_id = "Z0721508L9EAL8M7N6NM"
  name    = ""
  type    = "A"
  ttl     = 300
  set_identifier = "US EAST"
  latency_routing_policy {
    region = "us-east-1"
  }

  records = ["54.173.109.150"]
}

resource "aws_route53_record" "a-aws_west-record" {
  zone_id = "Z0721508L9EAL8M7N6NM"
  name    = ""
  type    = "A"
  ttl     = 300
  set_identifier = "US WEST"
  latency_routing_policy {
    region = "us-west-2"
  }

  records = ["54.201.88.248"]
}