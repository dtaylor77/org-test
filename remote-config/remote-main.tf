provider "aws" {
  region  = "us-east-1"
  profile = var.aws_profile
}


# resource "aws_inspector2_enabler" "activate-inspector" {
#   account_ids    = ["199660179115"]
#   resource_types = ["ECR", "EC2", "LAMBDA"]
# }

# resource "aws_inspector2_member_association" "member-account-association" {
#   account_id = ["530265417107"]
# }
