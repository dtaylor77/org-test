resource "aws_vpc" "my_vpc" {
  cidr_block = "10.2.0.0/16"
  tags = {
    Name = "Mytf9VPC"
  }
}
