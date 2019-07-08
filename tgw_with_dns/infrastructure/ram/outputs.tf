# ANCHOR RAM Resource Association

# STUB TGW Resource Association ID
output "ram_resource_association" {
  value = "${aws_ram_resource_association.tgw_ram_association.id}"
} 

# ANCHOR RAM Principal Association

# STUB Dev Principal Association ID
output "ram_principal_association" {
  value = "${aws_ram_principal_association.tgw_share_dev.id}"
}