# ANCHOR TGW VPC Attachments

# STUB Edge VPC Attachment ID
output "edge_attachment" {
  value = "${aws_ec2_transit_gateway_vpc_attachment.edge_attachment.id}"
}
# STUB Tools VPC Attachment ID
output "tools_attachment" {
  value = "${aws_ec2_transit_gateway_vpc_attachment.tools_attachment.id}"
}
# STUB Dev VPC Attachment ID
output "dev_attachment" {
  value = "${aws_ec2_transit_gateway_vpc_attachment.dev_attachment.id}"
}

# ANCHOR TGW VPC Attachment Accepters

# STUB Dev VPC Attachment Accepter ID
output "dev_attachment_accepter" {
  value = "${aws_ec2_transit_gateway_vpc_attachment_accepter.dev_attachment_accepter.id}"
}