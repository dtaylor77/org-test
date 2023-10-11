provider "aws" {
  region  = var.region
}

resource "aws_s3_bucket" "terraform_remote_state" {
  bucket  = var.bucket_name
}

# resource "aws_inspector2_enabler" "activate-inspector" {
#   account_ids    = ["199660179115"]
#   resource_types = ["ECR", "EC2", "LAMBDA"]
# }

# resource "aws_inspector2_member_association" "member-account-association" {
#   account_id = ["530265417107"]
# }
