# ANCHOR EIP

# STUB Elastic IP for Edge Gateway 
resource "aws_eip" "edge_eip" {
  provider = "aws.lab"

  tags = {
    Name = "edge_eip"
    Team = "cloud_infrastructure"
  }
}

# ANCHOR NAT Gateways

# STUB Edge NAT Gateway
resource "aws_nat_gateway" "edge_nat" {
  provider      = "aws.lab"
  allocation_id = "${aws_eip.edge_eip.id}"
  subnet_id     = "${var.edge_public2_id}"
}
