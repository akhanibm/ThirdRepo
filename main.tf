provider "aws" {
  region = "us-west-1"
}

# Consuming your Private Registry Module
module "webapp_storage" {
  source  = "app.terraform.io/akhan-21/webapp/aws"
  version = "2.0.0"

  # Pass required variables defined in the module
  environment = "dev"
  owner       = "engineering"
}