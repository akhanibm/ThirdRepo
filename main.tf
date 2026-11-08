terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "webapp2" {
  source  = "app.terraform.io/akhan-21/webapp2/aws"
  version = "3.0.1"
}