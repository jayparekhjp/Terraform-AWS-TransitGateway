# ANCHOR Route Tables

# STUB Edge Public RT
# Lab Account - Edge VPC Public Route Table 
resource "aws_route_table" "edge_public_rt" {
  provider = "aws.lab"
  vpc_id   = "${var.edge_id}"

  tags = {
    Name = "edge_public_rt"
    Team = "cloud_infrastructure"
  }
}
# STUB Edge Private RT
# Lab Account - Edge VPC Private Route Table
resource "aws_route_table" "edge_private_rt" {
  provider = "aws.lab"
  vpc_id   = "${var.edge_id}"

  tags = {
    Name = "edge_private_rt"
    Team = "cloud_infrastructure"
  }
}

# STUB Tools RT1
# Lab Account - Tools VPC Route Table 1
resource "aws_route_table" "tools_rt1" {
  provider = "aws.lab"
  vpc_id   = "${var.tools_id}"

  tags = {
    Name = "tools_rt1"
    Team = "cloud_infrastructure"
  }
}

# STUB Dev RT1
# Dev Account - Dev VPC Route Table 1
resource "aws_route_table" "dev_rt1" {
  provider = "aws.dev"
  vpc_id   = "${var.dev_id}"

  tags = {
    Name = "dev_rt1"
    Team = "cloud_infrastructure"
  }
}

# ANCHOR Main Route Table Association

# STUB Edge Private RT Route Table
# Lab Account - Making Edge Private RT Main Route Table for Edge VPC
resource "aws_main_route_table_association" "edge_private_rt" {
  provider       = "aws.lab"
  vpc_id         = "${var.edge_id}"
  route_table_id = "${aws_route_table.edge_private_rt.id}"
}
# STUB Tools RT1 Route Table
# Lab Account - Making Tools RT1 Main Route Table for Tools VPC
resource "aws_main_route_table_association" "tools_rt1" {
  provider       = "aws.lab"
  vpc_id         = "${var.tools_id}"
  route_table_id = "${aws_route_table.tools_rt1.id}"
}
# STUB Dev RT1 Route Table
# Dev Account - Making Dev RT1 Main Route Table for Dev VPC
resource "aws_main_route_table_association" "dev_rt1" {
  provider       = "aws.dev"
  vpc_id         = "${var.dev_id}"
  route_table_id = "${aws_route_table.dev_rt1.id}"
}

# ANCHOR Subnet RT Associations

# STUB Edge Public Subnet Associations
# Lab Account - Edge VPC Public Subnet1 Public RT Association
resource "aws_route_table_association" "edge_public1_association" {
  provider       = "aws.lab"
  subnet_id      = "${var.edge_public1_id}"
  route_table_id = "${aws_route_table.edge_public_rt.id}"
}
# Lab Account - Edge VPC Public Subnet2 Public RT Association
resource "aws_route_table_association" "edge_public2_association" {
  provider       = "aws.lab"
  subnet_id      = "${var.edge_public2_id}"
  route_table_id = "${aws_route_table.edge_public_rt.id}"
}
# Lab Account - Edge VPC Public Subnet3 Public RT Association
resource "aws_route_table_association" "edge_public3_association" {
  provider       = "aws.lab"
  subnet_id      = "${var.edge_public3_id}"
  route_table_id = "${aws_route_table.edge_public_rt.id}"
}

# # STUB Edge Private Subnet Associations
# # Lab Account - Edge VPC Private Subnet1 Private RT Association
# resource "aws_route_table_association" "edge_private1_association" {
#   provider       = "aws.lab"
#   subnet_id      = "${var.edge_private1_id}"
#   route_table_id = "${aws_route_table.edge_private_rt.id}"
# }
# # Lab Account - Edge VPC Private Subnet2 Private RT Association
# resource "aws_route_table_association" "edge_private2_association" {
#   provider       = "aws.lab"
#   subnet_id      = "${var.edge_private2_id}"
#   route_table_id = "${aws_route_table.edge_private_rt.id}"
# }
# # Lab Account - Edge VPC Private Subnet3 Private RT Association
# resource "aws_route_table_association" "edge_private3_association" {
#   provider       = "aws.lab"
#   subnet_id      = "${var.edge_private3_id}"
#   route_table_id = "${aws_route_table.edge_private_rt.id}"
# }

# STUB Tools Subnet Associations
# Lab Account - Tools VPC Subnet1 RT1 Association
resource "aws_route_table_association" "tools_subnet1_association" {
  provider       = "aws.lab"
  subnet_id      = "${var.tools_subnet1_id}"
  route_table_id = "${aws_route_table.tools_rt1.id}"
}
# Lab Account - Tools VPC Subnet2 RT1 Association
resource "aws_route_table_association" "tools_subnet2_association" {
  provider       = "aws.lab"
  subnet_id      = "${var.tools_subnet2_id}"
  route_table_id = "${aws_route_table.tools_rt1.id}"
}
# Lab Account - Tools VPC Subnet3 RT1 Association
resource "aws_route_table_association" "tools_subnet3_association" {
  provider       = "aws.lab"
  subnet_id      = "${var.tools_subnet3_id}"
  route_table_id = "${aws_route_table.tools_rt1.id}"
}


# STUB Dev Subnet Associations
# Dev Account - Dev VPC Subnet1 RT1 Association
resource "aws_route_table_association" "dev_subnet1_association" {
  provider       = "aws.dev"
  subnet_id      = "${var.dev_subnet1_id}"
  route_table_id = "${aws_route_table.dev_rt1.id}"
}
# Dev Account - Dev VPC Subnet2 RT1 Association
resource "aws_route_table_association" "dev_subnet2_association" {
  provider       = "aws.dev"
  subnet_id      = "${var.dev_subnet2_id}"
  route_table_id = "${aws_route_table.dev_rt1.id}"
}
# Dev Account - Dev VPC Subnet2 RT1 Association
resource "aws_route_table_association" "dev_subnet3_association" {
  provider       = "aws.dev"
  subnet_id      = "${var.dev_subnet3_id}"
  route_table_id = "${aws_route_table.dev_rt1.id}"
}