# ANCHOR Provider Variables

# STUB Lab Account Assume Role
variable "lab_role" {
  type        = "string"
  description = "Role to assume to deploy resources in Lab Account"
}
# STUB Dev Account Assume Role
variable "dev_role" {
  type        = "string"
  description = "Role to assume to deploy resources in Dev Account"
}

# ANCHOR Instance Variables

# STUB Instance Type
variable "instance_type" {
  type        = "string"
  description = "Instance Type"
}

# STUB Edge Public Subnet ID
variable "edge_public_subnet_id" {
  type        = "string"
  description = "Edge Instance Subnet ID"
}
# STUB Edge Private Subnet ID
variable "edge_private_subnet_id" {
  type        = "string"
  description = "Edge Instance Subnet ID"
}

# STUB Tools Subnet ID
variable "tools_subnet_id" {
  type        = "string"
  description = "Tools Instance Subnet ID"
}

# STUB Dev Subnet ID
variable "dev_subnet_id" {
  type        = "string"
  description = "Dev Instance Subnet ID"
}

# STUB Edge SG1 ID
variable "edge_sg1_id" {
  type        = "string"
  description = "Edge Instance Security Group ID"
}
# STUB Edge SG2 ID
variable "edge_sg2_id" {
  type        = "string"
  description = "Edge Instance Security Group ID"
}

# STUB Tools SG ID
variable "tools_sg_id" {
  type        = "string"
  description = "Tools Instance Security Group ID"
}

# STUB Dev SG ID
variable "dev_sg_id" {
  type        = "string"
  description = "Dev Instance Security Group ID"
}

# ANCHOR Key Pairs

# STUB Lab Account Key Pair
variable "lab_key" {
  type        = "string"
  description = "Lab Account Key Pair"
}

# STUB Dev Account Key Pair
variable "dev_key" {
  type        = "string"
  description = "Dev Account Key Pair"
}

# ANCHOR Route 53 DNS Zones

# STUB US1 Private Zones
variable "us1_dns_zone_id" {
  type        = "string"
  description = "us1 Private Zone ID"
}