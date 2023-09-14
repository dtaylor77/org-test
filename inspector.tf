resource "aws_inspector2_enabler" "aws_inspector" {
  account_ids    = var.account_id
  resource_types = ["ECR", "EC2", "LAMBDA"]
}
