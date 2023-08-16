terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=5.10.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-up-and-running-statezpl-ccs"
    dynamodb_table = "terraform-up-and-running-locks-ccs"
    key            = "global/terraform.tfstate"
    region         = "eu-central-1"
    profile        = "default" 
  } 
} 

provider "aws" {
  region = var.region
  profile = "default"
}
