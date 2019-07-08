# ANCHOR TGW VPC Attachments

# STUB Edge VPC Attachment
# Lab Account - Edge VPC TGW Attachment
resource "aws_ec2_transit_gateway_vpc_attachment" "edge_attachment" {
  provider           = "aws.lab"
  subnet_ids         = ["${var.edge_private1_id}", "${var.edge_private2_id}", "${var.edge_private3_id}"]
  transit_gateway_id = "${var.tgw}"
  vpc_id             = "${var.edge_id}"

  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = {
    Name = "edge_attachment"
    Team = "cloud_infrastructure"
  }
}

# STUB Tools VPC Attachment
# Lab Account - Tools VPC TGW Attachment
resource "aws_ec2_transit_gateway_vpc_attachment" "tools_attachment" {
  provider           = "aws.lab"
  subnet_ids         = ["${var.tools_subnet1_id}", "${var.tools_subnet2_id}", "${var.tools_subnet3_id}"]
  transit_gateway_id = "${var.tgw}"
  vpc_id             = "${var.tools_id}"

  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = {
    Name = "tools_attachment"
    Team = "cloud_infrastructure"
  }
}

# STUB Dev VPC Attachment
# Dev Account - Dev VPC TGW Attachment
resource "aws_ec2_transit_gateway_vpc_attachment" "dev_attachment" {
  provider           = "aws.dev"
  subnet_ids         = ["${var.dev_subnet1_id}", "${var.dev_subnet2_id}", "${var.dev_subnet3_id}"]
  transit_gateway_id = "${var.tgw}"
  vpc_id             = "${var.dev_id}"


  tags = {
    Name = "dev_attachment"
    Team = "cloud_infrastructure"
  }

  depends_on = ["aws_ec2_transit_gateway_vpc_attachment.edge_attachment", "aws_ec2_transit_gateway_vpc_attachment.tools_attachment"]
}

# STUB Dev VPC Attachment Accept
# Lab Account - Accept TGW Attachment from Dev Account 
resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "dev_attachment_accepter" {
  provider                      = "aws.lab"
  transit_gateway_attachment_id = "${aws_ec2_transit_gateway_vpc_attachment.dev_attachment.id}"
  
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = {
    Name = "dev_attachment_accepter"
    Team = "cloud_infrastructure"
  }

  depends_on = ["aws_ec2_transit_gateway_vpc_attachment.dev_attachment"]
}