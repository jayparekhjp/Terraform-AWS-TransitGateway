# ANCHOR Transit Gateway

# STUB Transit Gateway ID
output "tgw" {
  value = "${aws_ec2_transit_gateway.edge_tgw.id}"
}
# STUB Transit Gateway ARN
output "tgw_arn" {
  value = "${aws_ec2_transit_gateway.edge_tgw.arn}"
}
