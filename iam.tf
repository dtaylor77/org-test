data "aws_iam_policy_document" "policy-doc" {
  statement {
    sid    = "1"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    actions = [
      "kms:GenerateDataKey*",
      "kms:Decrypt",
    ]
    resources = "*"
  }
}



# resource "aws_iam_policy" "iam-policy" {
#   name        = "kms-iam-policy"
#   description = "kms iam policy"
#   policy      = data.aws_iam_policy_document.policy-doc.json
# }

resource "aws_kms_key_policy" "key-policy" {
  key_id = aws_kms_key.cloudtrail-key.id
  policy = data.aws_iam_policy_document.policy-doc.json
}