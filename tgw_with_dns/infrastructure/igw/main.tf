# ANCHOR Internet Gateway

# STUB Edge IGW
# Lab Account - Edge VPC IGW
resource "aws_internet_gateway" "edge_igw" {
  provider = "aws.lab"
  vpc_id = "${var.edge_id}"

  tags = {
    Name = "edge_igw"
    Team = "cloud_infrastructure"
  }
}