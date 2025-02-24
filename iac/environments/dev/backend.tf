# backend.tf - terraform remote state storage in S3

terraform {
  backend "s3" {
    bucket  = "terraform-state-app-bucket01"
    key     = "app/dev/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
    acl     = "private"
    dynamodb_table = "app-terraform-state-lock"
  }
}