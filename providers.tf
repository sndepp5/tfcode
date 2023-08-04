terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.10.0"
    }
  }
}

provider "aws" {
  region = var.region
  #profile = "default"
  access_key = "AKIARVVDXOCMN6J6S2QE"
  secret_key = "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"
}
