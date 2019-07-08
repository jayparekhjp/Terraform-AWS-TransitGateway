# ANCHOR VPC Routing

# STUB Edge Public RT Routes
# Lab Account - Edge Public RT - Edge to Internet - Goes to IGW
resource "aws_route" "edge_public_to_internet" {
  provider               = "aws.lab"
  route_table_id         = "${var.edge_public_rt}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${var.igw}"

  depends_on = ["var.tgw"]
}
# # Lab Account - Edge Public RT - Edge to Tools - Goes to TGW
# resource "aws_route" "edge_public_to_tools" {
#   provider               = "aws.lab"
#   route_table_id         = "${var.edge_public_rt}"
#   destination_cidr_block = "${var.tools_cidr_block}"
#   transit_gateway_id     = "${var.tgw}"

#   depends_on = ["var.tgw"]
# }
# # Lab Account - Edge Public RT - Edge to Dev - Goes to TGW
# resource "aws_route" "edge_public_to_dev" {
#   provider               = "aws.lab"
#   route_table_id         = "${var.edge_public_rt}"
#   destination_cidr_block = "${var.dev_cidr_block}"
#   transit_gateway_id     = "${var.tgw}"

#   depends_on = ["var.tgw"]
# }

# STUB Edge Private RT Routes
# Lab Account - Edge Private RT - Edge to Internet - Goes to IGW
resource "aws_route" "edge_private_to_internet" {
  provider               = "aws.lab"
  route_table_id         = "${var.edge_private_rt}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${var.nat}"

  depends_on = ["var.tgw"]
}
# Lab Account - Edge Private RT - Edge to Tools - Goes to TGW
resource "aws_route" "edge_private_to_tools" {
  provider               = "aws.lab"
  route_table_id         = "${var.edge_private_rt}"
  destination_cidr_block = "${var.tools_cidr_block}"
  transit_gateway_id     = "${var.tgw}"

  depends_on = ["var.tgw"]
}
# Lab Account - Edge Private RT - Edge to Dev - Goes to TGW
resource "aws_route" "edge_private_to_dev" {
  provider               = "aws.lab"
  route_table_id         = "${var.edge_private_rt}"
  destination_cidr_block = "${var.dev_cidr_block}"
  transit_gateway_id     = "${var.tgw}"

  depends_on = ["var.tgw"]
}

# STUB Tools RT1 Routes
# Lab Account - Tools RT1 - Tools to Internet - Goes to TGW
resource "aws_route" "tools_to_internet" {
  provider               = "aws.lab"
  route_table_id         = "${var.tools_rt1}"
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = "${var.tgw}"

  depends_on = ["var.tgw"]
}
# Lab Account - Tools RT1 - Tools to Edge - Goes to TGW
resource "aws_route" "tools_to_edge" {
  provider               = "aws.lab"
  route_table_id         = "${var.tools_rt1}"
  destination_cidr_block = "${var.edge_cidr_block}"
  transit_gateway_id     = "${var.tgw}"


  depends_on = ["var.tgw"]
}

# STUB Dev RT1 Routes
# Dev Account - Dev RT1 - Dev to Internet - Goes to TGW
resource "aws_route" "dev_to_internet" {
  provider               = "aws.dev"
  route_table_id         = "${var.dev_rt1}"
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = "${var.tgw}"

  depends_on = ["var.tgw"]
}
# Dev Account - Tools RT1 - Dev to Edge - Goes to TGW
resource "aws_route" "dev_to_edge" {
  provider               = "aws.dev"
  route_table_id         = "${var.dev_rt1}"
  destination_cidr_block = "${var.edge_cidr_block}"
  transit_gateway_id     = "${var.tgw}"

  depends_on = ["var.tgw"]
}

# ANCHOR Network ACLs

# STUB Tools NACL
resource "aws_default_network_acl" "tools_nacl" {
  provider               = "aws.lab"
  default_network_acl_id = "${var.tools_network_acl}"

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "deny"
    cidr_block = "10.30.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  subnet_ids = ["${var.tools_subnet1_id}", "${var.tools_subnet2_id}", "${var.tools_subnet3_id}"]
}

# STUB Dev NACL
resource "aws_default_network_acl" "dev_nacl" {
  provider               = "aws.dev"
  default_network_acl_id = "${var.dev_network_acl}"

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "deny"
    cidr_block = "10.20.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  subnet_ids = ["${var.dev_subnet1_id}", "${var.dev_subnet2_id}", "${var.dev_subnet3_id}"]
}
