# resource "aws_vpc" "my_vpc" {
#   cidr_block = "10.2.0.0/16"
#   tags = {
#     Name = "Mytf2VPC"
#   }
# }

resource "aws_ce_anomaly_monitor" "service_monitor1" {
  name              = "AWSServiceMonitor1"
  monitor_type      = "DIMENSIONAL"
  monitor_dimension = "SERVICE"
}

resource "aws_ce_anomaly_monitor" "monitor2" {
  name         = "Monitor2"
  monitor_type = "CUSTOM"
  monitor_specification = jsonencode(
    {
      "And" : null,
      "CostCategories" : null,
      "Dimensions" : {
        "Key" : "LINKED_ACCOUNT",
        "Values" : ["199660179115, 530265417107"],
        "MatchOptions" : ["EQUALS"]
      },
      "Not" : null,
      "Or" : null,
      "Tags" : null
  })

}

resource "aws_ce_anomaly_subscription" "test" {
  name      = "DAILYSUBSCRIPTION"
  frequency = "DAILY"

  monitor_arn_list = [
    aws_ce_anomaly_monitor.service_monitor1.arn,
    aws_ce_anomaly_monitor.monitor2.arn,
  ]

  subscriber {
    type    = "EMAIL"
    address = "dhavaltailor777@gmail.com"
  }
  threshold_expression {
    dimension {
      key           = "ANOMALY_TOTAL_IMPACT_ABSOLUTE"
      values        = ["1.0"]
      match_options = ["GREATER_THAN_OR_EQUAL"]
    }
  }
}
