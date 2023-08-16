terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=5.10.0"
    }
  }

  backend "s3" {
    bucket         = "bshorg-ss-bucket-check"
    dynamodb_table = "bshorg-dynamodb-table-check"
    key            = "global/terraform.tfstate"
    region         = "eu-central-1"
    profile        = "default" 
  } 
} 
