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

provider "aws" {
  region = "us-east-1"
}

# VIOLATION 1: Missing Mandatory Tags
# The Sentinel policy checks for "Environment", "Owner", and "Project" tags. 
# Omitting the 'tags' block entirely will cause the tagging rule to fail.
resource "aws_s3_bucket" "violating_bucket" {
  bucket = "sentinel-failure-test-bucket-987654"
}

# VIOLATION 2: Public Access Enabled
# The Sentinel policy requires all public access restriction flags to be true.
# Setting these to 'false' leaves the bucket open and triggers the public bucket failure.
resource "aws_s3_bucket_public_access_block" "violating_public_block" {
  bucket = aws_s3_bucket.violating_bucket.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}
