# data "aws_iam_policy_document" "policy-doc" {
#   statement {
#     sid    = "1"
#     effect = "Allow"
#     principals {
#       type        = "Service"
#       identifiers = ["cloudtrail.amazonaws.com", "kms.amazonaws.com"]
#     }
#     actions = [
#       "kms:GenerateDataKey*",
#       "kms:Decrypt",
#       "kms:PutKeyPolicy"
#     ]
#     resources = ["*"]
#   }

# }


# resource "aws_kms_key_policy" "key-policy" {
#   key_id = aws_kms_key.cloudtrail-key.id
#   policy = data.aws_iam_policy_document.policy-KMS.json
# }


# data "aws_iam_policy_document" "policy-KMS" {
#   statement {
#     sid       = "1"
#     effect    = "Allow"
#     actions   = ["KMS:*"]
#     resources = ["*"]
#     principals {
#       type        = "AWS"
#       identifiers = ["arn:aws:iam::199660179115:root"]
#     }
#   }
#   statement {
#     sid       = "2"
#     effect    = "Allow"
#     actions   = ["KMS:GenerateDataKey*", "kms:Decrypt*"]
#     resources = ["*"]
#     principals {
#       type        = "Service"
#       identifiers = ["cloudtrail.amazonaws.com"]

#     }
#     condition {
#       test     = "StringEquals"
#       variable = "aws:SourceArn"
#       values   = ["arn:aws:cloudtrail:us-east-1:530265417107:trail/niki-trail"]
#     }
#     condition {
#       test     = "StringLike"
#       variable = "kms:EncryptionContext:aws:cloudtrail:arn"
#       values   = ["arn:aws:cloudtrail:us-east-1:530265417107:trail/niki-trail/*"]
#     }
#   }
# }
