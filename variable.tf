variable "aws_profile" {}

variable "account_id" {
  default = "199660179115"
}

variable "account_name" {
  default = "dhaval3"
}

variable "vpc_id" {
  description = "The ID of the VPC
}

variable "bucket_name" {
  description = "The name of the new environment specific bucket to be created"
}

# variable "bucket_name_storage" {
#   description = "The name of the new environment specific bucket to be created"
# }

# variable "profile_name" {
#   description = "The profile_name where remote state file will get created"
# }

variable "region" {
  description = "The AWS region"
}

variable "environment" {
  description = "The environment (dev/staging/prod)"
}

variable "key" {
  description = "tf state bucket key"
}
