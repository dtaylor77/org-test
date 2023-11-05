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
#   policy = data.aws_iam_policy_document.policy-doc.json
# }

resource "aws_iam_role" "test-role-tf" {
  name               = "test-role-tf"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json

}

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "policy-ec2" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}


resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
  policy      = data.aws_iam_policy_document.policy-ec2.json
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.test-role-tf.name
  policy_arn = aws_iam_policy.policy.arn
}