resource "aws_vpc_peering_connection" "vpc-peering" {
  peer_owner_id = var.reporting_accountId
  peer_vpc_id   = var.reporting-vpc-id[var.environment]
  vpc_id        = "vpc-08212d355e511403e"
  peer_region   = "us-east-1"
}
