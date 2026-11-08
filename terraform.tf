terraform {
  cloud {
    organization = "akhan-21"

    workspaces {
      name = "dev-app-workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}