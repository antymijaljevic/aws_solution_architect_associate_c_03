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
  access_key = "AKIA6I5UQEES6KBT5VHK"
  secret_key = "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"
}

# export AWS_ACCESS_KEY_ID="anaccesskey"
# export AWS_SECRET_ACCESS_KEY="asecretkey"
# export AWS_REGION="us-east-1"