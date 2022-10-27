resource "aws_acm_certificate" "playground-cert" {
  domain_name       = "playground-test.com"
  validation_method = "DNS"

  tags = {
    Environment = "playground-cert"
  }

  lifecycle {
    create_before_destroy = true
  }
}