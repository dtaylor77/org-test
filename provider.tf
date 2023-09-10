provider "aws" {
  region  = var.region
  profile = var.profile_name
}

resource "aws_s3_bucket" "terraform_remote_state" {
  bucket  = var.bucket_name
}
