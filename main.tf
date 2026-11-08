provider "aws" {
  region = "us-west-1"
}

module "webapp2" {
  source  = "app.terraform.io/akhan-21/webapp2/aws"
  version = "2.0.5"
}