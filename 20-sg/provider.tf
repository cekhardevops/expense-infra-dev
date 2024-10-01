terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "expense-remote"
    key            = "expense-sg"
    region         = "us-east-1"
    dynamodb_table = "81s-state-lock"
  }
}
provider "aws" {
  region = "us-east-1"
}