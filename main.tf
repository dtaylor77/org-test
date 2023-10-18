# resource "aws_vpc" "my_vpc" {
#   cidr_block = "10.2.0.0/16"
#   tags = {
#     Name = "Mytf1VPC"
#   }
# }

resource "aws_ce_anomaly_monitor" "service_monitor" {
  name              = "AWSServiceMonitor"
  monitor_type      = "DIMENSIONAL"
  monitor_dimension = "SERVICE"
}


resource "aws_ce_anomaly_subscription" "test" {
  name = "DAILYSUBSCRIPTION"
  #threshold = 100
  frequency = "DAILY"

  monitor_arn_list = [
    aws_ce_anomaly_monitor.service_monitor.arn,
  ]

  subscriber {
    type    = "EMAIL"
    address = "dhavaltailor777@gmail.com"
  }
}
