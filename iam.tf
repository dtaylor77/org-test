data "aws_iam_policy_document" "policy-doc" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    resources = ["*"]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = ["arn:aws:cloudtrail:us-east-1:530265417107:trail/niki-trail"]
    }

    condition {
      test     = "StringLike"
      variable = "kms:EncryptionContext:aws:cloudtrail:arn"
      values   = ["arn:aws:cloudtrail:us-east-1:530265417107:trail/niki-trail/*"]
    }

    actions = [
      "GenerateDataKey*",
    "kms:Decrypt", ]
  }
}

resource "aws_iam_policy" "iam-policy" {
  name        = "kms-iam-policy"
  description = "kms iam policy"
  policy      = data.aws_iam_policy_document.policy-doc.json
}

resource "aws_kms_key_policy" "key-policy" {
  key_id = aws_kms_key.cloudtrail-key.id
  policy = aws_iam_policy.iam-policy.json
}