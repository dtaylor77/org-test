provider "aws" {
  region = var.region
  #  profile = var.aws_profile
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "dhaval-aquanow-test-tf-state-file-bucket"
    key     = "security/terraform.tfstate"
    region  = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  alias = "niki"

  assume_role {
    role_arn     = "arn:aws:iam::530265417107:role/provider-assume-role-test"
    session_name = "SESSION"
    external_id  = "12345"
  }
  
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

#resource "aws_s3_bucket" "terraform_remote_state" {
#  bucket = var.bucket_name
#}
