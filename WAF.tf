resource "aws_wafv2_web_acl" "web_acl_cloudfront" {
  name        = "${var.environment}-cloudfront"
  description = "waf managed rule."
  scope       = "CLOUDFRONT"

  default_action {
    allow {}
  }

  rule {
    name     = "AWS-AWSManagedRulesCommonRuleSet"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesATPRuleSet"
        vendor_name = "AWS"

        rule_action_override {
          action_to_use {
            count {}
          }

          name = "NoUserAgent_HEADER"
        }

      }

      visibility_config {
        cloudwatch_metrics_enabled = false
        metric_name                = "AWSManagedRulesATPRuleSet"
        sampled_requests_enabled   = false
      }
    }
  }
}   