# ANCHOR VPC IDs
# Edge VPC ID
output "edge_id" {
  value = "${aws_vpc.edge.id}"
}
# Tools VPC ID
output "tools_id" {
  value = "${aws_vpc.tools.id}"
}
# Dev VPC ID
output "dev_id" {
  value = "${aws_vpc.dev.id}"
}

# ANCHOR VPC CIDR Blocks
# Edge VPC CIDR Block
output "edge_cidr_block" {
  value = "${aws_vpc.edge.cidr_block}"
}
# Tools VPC CIDR Block
output "tools_cidr_block" {
  value = "${aws_vpc.tools.cidr_block}"
}
# Dev VPC CIDR Block
output "dev_cidr_block" {
  value = "${aws_vpc.dev.cidr_block}"
}

# ANCHOR VPC NACLs

# Edge VPC NACL
output "edge_network_acl" {
  value = "${aws_vpc.edge.default_network_acl_id}"
}
# Tools VPC NACL
output "tools_network_acl" {
  value = "${aws_vpc.tools.default_network_acl_id}"
}
# Dev VPC NACL
output "dev_network_acl" {
  value = "${aws_vpc.dev.default_network_acl_id}"
}