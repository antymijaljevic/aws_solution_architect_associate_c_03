terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.34"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

provider "aws" {
  region = "us-east-1"
  access_key = "x"
  secret_key = "x"
}