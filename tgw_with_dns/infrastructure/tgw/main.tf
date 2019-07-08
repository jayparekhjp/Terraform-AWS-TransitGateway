# ANCHOR Transit Gateway

# STUB Edge TGW
# Lab Account - Transit Gateway
resource "aws_ec2_transit_gateway" "edge_tgw" {
  provider                        = "aws.lab"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = {
    Name = "edge_tgw"
    Team = "cloud_infrastructure"
  }
}