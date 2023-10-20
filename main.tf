# resource "aws_vpc" "my_vpc" {
#   cidr_block = "10.2.0.0/16"
#   tags = {
#     Name = "Mytf2VPC"
#   }
# }

resource "aws_resourceexplorer2_index" "index-example1" {
  type = "AGGREGATOR"
}

resource "aws_resourceexplorer2_view" "view-example1" {
  name         = "exampleview1"
  default_view = "true"

  included_property {
    name = "tags"
  }

  depends_on = [aws_resourceexplorer2_index.index-example1]
}