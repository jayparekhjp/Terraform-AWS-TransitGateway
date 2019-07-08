# ANCHOR TGW Route Tables

# STUB TGW Edge Route Tables
output "edge_tgw_rt" {
  value = "${aws_ec2_transit_gateway_route_table.edge_tgw_rt}"
}
# STUB TGW Tools Route Tables
output "tools_tgw_rt" {
  value = "${aws_ec2_transit_gateway_route_table.tools_tgw_rt}"
}
# STUB TGW Dev Route Tables
output "dev_tgw_rt" {
  value = "${aws_ec2_transit_gateway_route_table.dev_tgw_rt}"
}