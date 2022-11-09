# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/custom-service-endpoints
# https://www.terraform.io/language

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.34"
    }
  }
}
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAWGFHVGZ3NL6IBRAU"
  secret_key = "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"
}

