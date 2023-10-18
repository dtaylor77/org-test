# resource "aws_vpc" "my_vpc" {
#   cidr_block = "10.2.0.0/16"
#   tags = {
#     Name = "Mytf2VPC"
#   }
# }

resource "aws_ce_anomaly_monitor" "service_monitor" {
  name              = "AWSServiceMonitor"
  monitor_type      = "DIMENSIONAL"
  monitor_dimension = "SERVICE"
}


resource "aws_ce_anomaly_subscription" "test" {
  name = "DAILYSUBSCRIPTION"
  frequency = "DAILY"

  monitor_arn_list = [
    aws_ce_anomaly_monitor.service_monitor.arn,
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
}
