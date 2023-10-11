resource "aws_vpc_peering_connection" "vpc-peering" {
  peer_owner_id = var.reporting_accountId
  peer_vpc_id   = var.reporting-vpc-id[var.environment]
  vpc_id        = var.vpc_id
  peer_region   = "us-east-1"
}

# Create a route table for Dhaval3
resource "aws_route_table" "Route_Table_Dhaval3" {
  vpc_id = var.vpc_id
  }

# Create a route on Dhaval3 VPC RT
resource "aws_route" "route-2" {
  route_table_id            = aws_route_table.Route_Table.id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc-peering.id
}

# Reporting side of the connection
resource "aws_vpc_peering_connection_accepter" "peer-1" {
  provider = aws.reporting

  vpc_peering_connection_id = aws_vpc_peering_connection.vpc-peering.id
  auto_accept               = true

}

provider "aws" {
  alias   = "reporting"
  region  = "us-east-1"
}

# Create a route table for Reporting
resource "aws_route_table" "Route_Table_Reporting" {
  vpc_id = var.reporting-vpc-id[var.environment}
  }

# Create a route on reporting route table
resource "aws_route" "route-reporting" {
  provider                  = aws.reporting
  route_table_id            = aws_route_table.Route_Table_Reporting.id
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc-peering.id
}
