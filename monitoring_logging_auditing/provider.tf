# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.34"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

provider "aws" {}

# export AWS_ACCESS_KEY_ID="x" && export AWS_SECRET_ACCESS_KEY="x"