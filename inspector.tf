# resource "aws_inspector2_enabler" "aws_inspector" {
#  # account_ids    = var.account_id
#   account_ids    = [data.aws_caller_identity.current.account_id]
#   resource_types = ["LAMBDA", "ECR", "EC2"]
# }
