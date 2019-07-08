# ANCHOR TGW Routing Domains

# STUB Edge VPC Routing Domain
# Lab Account - Edge VPC TGW Route Table
resource "aws_ec2_transit_gateway_route_table" "edge_tgw_rt" {
  provider = "aws.lab"
  transit_gateway_id = "${var.tgw}"

  tags = {
    Name = "edge_tgw_rt"
    Team = "cloud_infrastructure"
  }
}

# STUB Tools VPC Routing Domain
# Lab Account - Tools VPC TGW Route Table
resource "aws_ec2_transit_gateway_route_table" "tools_tgw_rt" {
  provider = "aws.lab"
  transit_gateway_id = "${var.tgw}"

  tags = {
    Name = "tools_tgw_rt"
    Team = "cloud_infrastructure"
  }
}

# STUB Dev VPC Routing Domain
# Lab Account - Dev VPC TGW Route Table
resource "aws_ec2_transit_gateway_route_table" "dev_tgw_rt" {
  provider = "aws.lab"
  transit_gateway_id = "${var.tgw}"

  tags = {
    Name = "dev_tgw_rt"
    Team = "cloud_infrastructure"
  }
}

# ANCHOR TGW RT Attachment Associations

# STUB Edge Attachment RT Association
# Lab Account - Edge Attachment Routing Domain Association
resource "aws_ec2_transit_gateway_route_table_association" "edge_rt_association" {
  provider = "aws.lab"
  transit_gateway_attachment_id  = "${var.edge_attachment}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.edge_tgw_rt.id}"
}

# STUB Tools Attachment RT Association
# Lab Account - Tools Attachment Routing Domain Association
resource "aws_ec2_transit_gateway_route_table_association" "tools_rt_association" {
  provider = "aws.lab"
  transit_gateway_attachment_id  = "${var.tools_attachment}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.tools_tgw_rt.id}"
}

# STUB Dev Attachment RT Association
# Lab Account - Dev Attachment Routing Domain Association
resource "aws_ec2_transit_gateway_route_table_association" "dev_rt_association" {
  provider = "aws.lab"
  # transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.dev_attachment.id}"
  transit_gateway_attachment_id = "${var.dev_attachment_accepter}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.dev_tgw_rt.id}"

  depends_on = ["var.ram_resource_association", "var.ram_principal_association"]
}

# ANCHOR TGW RT Attachment Propagations

# STUB Edge Attachment RT Propagation
# Lab Account - Edge Attachment Routing Domain Propagation
resource "aws_ec2_transit_gateway_route_table_propagation" "edge_rt_propagation" {
  provider = "aws.lab"
  transit_gateway_attachment_id  = "${var.edge_attachment}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.edge_tgw_rt.id}"
}

# STUB Tools Attachment RT Propagation
# Lab Account - Tools Attachment Routing Domain Propagation
resource "aws_ec2_transit_gateway_route_table_propagation" "tools_rt_propagation" {
  provider = "aws.lab"
  transit_gateway_attachment_id  = "${var.tools_attachment}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.tools_tgw_rt.id}"
}

# STUB Dev Attachment RT Propagation
# Lab Account - Dev Attachment Routing Domain Propagation
resource "aws_ec2_transit_gateway_route_table_propagation" "dev_rt_propagation" {
  provider = "aws.lab"
  # transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.dev_attachment.id}"
  transit_gateway_attachment_id = "${var.dev_attachment_accepter}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.dev_tgw_rt.id}"

  depends_on = ["var.ram_resource_association", "var.ram_principal_association"]
}

# ANCHOR TGW Routing

# STUB Edge TGW RT Routes
# Lab Account - TGW Edge Routing Domain Route - Edge to Tools via TGW
resource "aws_ec2_transit_gateway_route" "edge_to_tools" {
  provider = "aws.lab"
  destination_cidr_block = "${var.tools_cidr_block}"
  transit_gateway_attachment_id = "${var.tools_attachment}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.edge_tgw_rt.id}"
}
# Lab Account - TGW Edge Routing Domain Route - Edge to Dev via TGW
resource "aws_ec2_transit_gateway_route" "edge_to_dev" {
  provider = "aws.lab"
  destination_cidr_block = "${var.dev_cidr_block}"
  transit_gateway_attachment_id = "${var.dev_attachment_accepter}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.edge_tgw_rt.id}"
}

# STUB Tools TGW RT Routes
# Lab Account - TGW Tools Routing Domain Route - Tools to Internet via TGW
resource "aws_ec2_transit_gateway_route" "tools_to_internet" {
  provider = "aws.lab"
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_attachment_id = "${var.edge_attachment}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.tools_tgw_rt.id}"
}
# Lab Account - TGW Tools Routing Domain Route - Tools to Edge via TGW
resource "aws_ec2_transit_gateway_route" "tools_to_edge" {
  provider = "aws.lab"
  destination_cidr_block = "${var.edge_cidr_block}"
  transit_gateway_attachment_id = "${var.edge_attachment}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.tools_tgw_rt.id}"
}

# STUB Dev TGW RT Routes
# Lab Account - TGW Dev Routing Domain Route - Dev to Internet via TGW
resource "aws_ec2_transit_gateway_route" "dev_to_internet" {
  provider = "aws.lab"
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_attachment_id = "${var.edge_attachment}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.dev_tgw_rt.id}"
}
# Lab Account - TGW Dev Routing Domain Route - Dev to Edge via TGW
resource "aws_ec2_transit_gateway_route" "dev_to_edge" {
  provider = "aws.lab"
  destination_cidr_block = "${var.edge_cidr_block}"
  transit_gateway_attachment_id = "${var.edge_attachment}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.dev_tgw_rt.id}"
}