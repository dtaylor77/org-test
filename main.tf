# resource "aws_vpc" "my_vpc" {
#   cidr_block = "10.2.0.0/16"
#   tags = {
#     Name = "Mytf2VPC"
#   }
# }

resource "aws_resourceexplorer2_index" "index-example" {
  type = "LOCAL"
}

resource "aws_resourceexplorer2_view" "view-example" {
  name = "exampleview"
}