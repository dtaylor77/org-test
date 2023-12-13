resource "aws_vpc" "test-vpc" {
  provider         = aws.niki
  cidr_block       = "10.7.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "niki-vpc"
  }
}