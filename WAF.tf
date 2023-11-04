# resource "aws_wafv2_web_acl" "web_acl_regional" {
#   name        = "${var.environment}-regional"
#   description = "aws waf managed rule to protect webapp."
#   scope       = "REGIONAL"

#   default_action {
#     allow {}
#   }

#   rule {
#     name     = "AWS-AWSManagedRulesAnonymousIpList"
#     priority = 6

#     override_action {
#       count {}
#     }

#     statement {
#       managed_rule_group_statement {
#         name        = "AWSManagedRulesAnonymousIpList"
#         vendor_name = "AWS"
#       }

#       ip_set_reference_statement {
#         arn = aws_wafv2_ip_set.ip_set_allow.arn
#       }
#     }

#     visibility_config {
#       cloudwatch_metrics_enabled = true
#       metric_name                = "AWS-AWSManagedRulesAnonymousIpList"
#       sampled_requests_enabled   = true
#     }
#   }

#   visibility_config {
#     cloudwatch_metrics_enabled = false
#     metric_name                = "friendly-metric-name"
#     sampled_requests_enabled   = false
#   }
# }

# resource "aws_wafv2_ip_set" "ip_set_allow" {
#   name               = "IP-Set"
#   description        = "IP set"
#   scope              = "REGIONAL"
#   ip_address_version = "IPV4"
#   addresses          = ["196.244.3.4/32"]

#   tags = {
#     Tag1 = "IP set"
#   }
# }
