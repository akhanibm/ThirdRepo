provider "aws" {
  region = "us-west-1"
}

# Consuming your Private Registry Module
module "webapp1" {
  source  = "app.terraform.io/akhan-21/webapp1/aws"
  version = "2.0.0"
}