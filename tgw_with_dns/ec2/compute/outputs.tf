# ANCHOR Instance AMI

# STUB AMI ID
output "amazon_linux_lab_id" {
  value = "${data.aws_ami.amazon_linux_lab.id}"
}

# ANCHOR Instance IDs

# STUB Edge Public Instance ID
output "edge_public_nstance_id" {
  value = "${aws_instance.edge_public_instance.id}"
}
# STUB Edge Private Instance ID
output "edge_private_nstance_id" {
  value = "${aws_instance.edge_private_instance.id}"
}

# STUB Tools Instance ID
output "tools_instance_id" {
  value = "${aws_instance.tools_instance.id}"
}
