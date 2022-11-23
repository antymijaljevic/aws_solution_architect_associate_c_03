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
}

# export AWS_ACCESS_KEY_ID=
# export AWS_SECRET_ACCESS_KEY=