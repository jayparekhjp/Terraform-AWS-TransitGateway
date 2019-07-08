# ANCHOR EIP

# STUB Edge EIP
output "edge_eip_id" {
  value = "${aws_eip.edge_eip.id}"
}

# ANCHOR Edge NAT Gateway

# STUB Edge NAT Gateway ID
output "edge_nat_id" {
  value = "${aws_nat_gateway.edge_nat.id}"
}
