# ANCHOR SG IDs

# STUB Edge SG1 ID
output "edge_sg1" {
  value = "${aws_security_group.edge_sg1.id}"
}
# STUB Edge SG2 ID
output "edge_sg2" {
  value = "${aws_security_group.edge_sg2.id}"
}

# STUB Tools SG1 ID
output "tools_sg1" {
  value = "${aws_security_group.tools_sg1.id}"
}

# STUB Dev SG1 ID
output "dev_sg1" {
  value = "${aws_security_group.dev_sg1.id}"
}