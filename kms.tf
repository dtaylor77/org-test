resource "aws_kms_key" "cloudtrail-key" {
  description             = "Cloudtrail log encryption"
  deletion_window_in_days = 7
  key_usage               = "ENCRYPT_DECRYPT"
}

resource "aws_kms_alias" "kms-alias" {
  name          = "alias/cloudtrail-key"
  target_key_id = aws_kms_key.cloudtrail-key.key_id
}

# resource "aws_kms_key_policy" "kms-key-policy" {
#   key_id = aws_kms_key.cloudtrail-key.id
#   policy = jsonencode({
#     Id = "id1"
#     Statement = [
#       {
#         Action = [
#           "GenerateDataKey*",
#           "kms:Decrypt",
#         ]
#         Effect = "Allow"
#         Principal = {
#           "Service" : "cloudtrail.amazonaws.com"
#         }
#         Resource = "*"
#         "Condition" : {
#           "StringEquals" : {
#             "aws:SourceArn" : "arn:aws:cloudtrail:us-east-1:530265417107:trail/niki-trail"
#           },
#           "StringLike" : {
#             "kms:EncryptionContext:aws:cloudtrail:arn" : "arn:aws:cloudtrail:us-east-1:530265417107:trail/niki-trail/*"
#           }
#         }
#         Sid = "Enable KMS Cloudtrail Permissions"
#       },
#     ]
#     Version = "2012-10-17"
#   })
# }