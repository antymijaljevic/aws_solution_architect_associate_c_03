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
  profile = "default"
}