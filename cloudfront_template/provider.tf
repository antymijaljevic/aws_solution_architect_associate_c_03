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
  profile = "default"
}

provider "aws" {
  region  = "us-west-2"
  alias   = "aws_west"
}
