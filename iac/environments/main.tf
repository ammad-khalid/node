# main.tf - This is a separate Terraform configuration for S3 Bucket for remote state

provider "aws" {
  region = "us-east-2"
}

# S3 bucket for remote state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-app-bucket01"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
}