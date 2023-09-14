provider "aws" {
  region  = var.region
#  profile = var.aws_profile
}

terraform {
  backend "s3" {
    encrypt = true
    bucket = "project-terraform-remote-state-us-east-1-dev"
    key    = "project/security/terraform.tfstate"
    region = "us-east-1"
  }
}


resource "aws_s3_bucket" "terraform_remote_state" {
  bucket = var.bucket_name
}
