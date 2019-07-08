# ANCHOR Route Table IDs

# STUB Edge Public RT ID
output "edge_public_rt" {
  value = "${aws_route_table.edge_public_rt.id}"
}
# STUB Edge Private RT ID
output "edge_private_rt" {
  value = "${aws_route_table.edge_private_rt.id}"
}

# STUB Tools RT1 ID
output "tools_rt1" {
  value = "${aws_route_table.tools_rt1.id}"
}

# STUB Dev RT1 ID
output "dev_rt1" {
  value = "${aws_route_table.dev_rt1.id}"
}