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

# export AWS_ACCESS_KEY_ID="AKIARNLREQQOM4AAYBHN" && export AWS_SECRET_ACCESS_KEY="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"