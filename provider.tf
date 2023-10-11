provider "aws" {
  region = var.region
  #  profile = var.aws_profile
}

terraform {
  backend "s3" {
    encrypt = true"
  }
}


#resource "aws_s3_bucket" "terraform_remote_state" {
#  bucket = var.bucket_name
#}
