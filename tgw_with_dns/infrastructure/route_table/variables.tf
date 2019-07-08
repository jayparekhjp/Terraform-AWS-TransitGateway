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

# ANCHOR VPC IDs

# STUB Edge VPC ID
variable "edge_id" {
  type        = "string"
  description = "Edge VPC ID to create Route Table"
}
# STUB Tools VPC ID
variable "tools_id" {
  type        = "string"
  description = "Tools VPC ID to create Route Table"
}
# STUB Dev VPC ID
variable "dev_id" {
  type        = "string"
  description = "Dev VPC ID to create Route Table"
}

# ANCHOR Subnet IDs

# STUB Edge Public Subnet1 ID
variable "edge_public1_id" {
  type        = "string"
  description = "Edge VPC Public Subnet 1 ID to associate with Route Table"
}
# STUB Edge Public Subnet2 ID
variable "edge_public2_id" {
  type        = "string"
  description = "Edge VPC Public Subnet 2 ID to associate with Route Table"
}
# STUB Edge Public Subnet3 ID
variable "edge_public3_id" {
  type        = "string"
  description = "Edge VPC Public Subnet 3 ID to associate with Route Table"
}

# STUB Edge Private Subnet1 ID
variable "edge_private1_id" {
  type        = "string"
  description = "Edge VPC Private Subnet 1 ID to associate with Route Table"
}
# STUB Edge Private Subnet2 ID
variable "edge_private2_id" {
  type        = "string"
  description = "Edge VPC Private Subnet 2 ID to associate with Route Table"
}
# STUB Edge Private Subnet3 ID
variable "edge_private3_id" {
  type        = "string"
  description = "Edge VPC Private Subnet 3 ID to associate with Route Table"
}

# STUB Tools Subnet1 ID
variable "tools_subnet1_id" {
  type        = "string"
  description = "Tools VPC Subnet 1 ID to associate with Route Table"
}
# STUB Tools Subnet2 ID
variable "tools_subnet2_id" {
  type        = "string"
  description = "Tools VPC Subnet 2 ID to associate with Route Table"
}
# STUB Tools Subnet3 ID
variable "tools_subnet3_id" {
  type        = "string"
  description = "Tools VPC Subnet 3 ID to associate with Route Table"
}

# STUB Dev Subnet1 ID
variable "dev_subnet1_id" {
  type        = "string"
  description = "Dev VPC Subnet 1 ID to associate with Route Table"
}
# STUB Dev Subnet2 ID
variable "dev_subnet2_id" {
  type        = "string"
  description = "Dev VPC Subnet 2 ID to associate with Route Table"
}
# STUB Dev Subnet3 ID
variable "dev_subnet3_id" {
  type        = "string"
  description = "Dev VPC Subnet 3 ID to associate with Route Table"
}