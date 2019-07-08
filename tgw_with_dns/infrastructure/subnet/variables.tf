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
  type          = "string"
  description   = "Edge VPC ID."
}
# STUB Tools VPC ID
variable "tools_id" {
  type          = "string"
  description   = "Tools VPC ID."
}
# STUB Dev VPC ID
variable "dev_id" {
  type          = "string"
  description   = "Dev VPC ID."
}

# ANCHOR Subnets CIDR Blocks

# STUB Edge Public Subnet 1 CIDR Block
variable "edge_public1_cidr_block" {
  type          = "string"
  description   = "Edge VPC Public Subnet 1 CIDR Block"
}
# STUB Edge Public Subnet 2 CIDR Block
variable "edge_public2_cidr_block" {
  type          = "string"
  description   = "Edge VPC Public Subnet 2 CIDR Block"
}
# STUB Edge Public Subnet 3 CIDR Block
variable "edge_public3_cidr_block" {
  type          = "string"
  description   = "Edge VPC Public Subnet 3 CIDR Block"
}

# STUB Edge Private Subnet 1 CIDR Block
variable "edge_private1_cidr_block" {
  type          = "string"
  description   = "Edge VPC Private Subnet 1 CIDR Block"
}
# STUB Edge Private Subnet 2 CIDR Block
variable "edge_private2_cidr_block" {
  type          = "string"
  description   = "Edge VPC Private Subnet 2 CIDR Block"
}
# STUB Edge Private Subnet 3 CIDR Block
variable "edge_private3_cidr_block" {
  type          = "string"
  description   = "Edge VPC Private Subnet 3 CIDR Block"
}


# STUB Tools Subnet 1 CIDR Block
variable "tools_subnet1_cidr_block" {
  type          = "string"
  description   = "Tools VPC Subnet 1 CIDR Block"
}
# STUB Tools Subnet 2 CIDR Block
variable "tools_subnet2_cidr_block" {
  type          = "string"
  description   = "Tools VPC Subnet 2 CIDR Block"
}
# STUB Tools Subnet 3 CIDR Block
variable "tools_subnet3_cidr_block" {
  type          = "string"
  description   = "Tools VPC Subnet 3 CIDR Block"
}

# STUB Dev Subnet 1 CIDR Block
variable "dev_subnet1_cidr_block" {
  type          = "string"
  description   = "Dev VPC Subnet 1 CIDR Block"
}
# STUB Dev Subnet 2 CIDR Block
variable "dev_subnet2_cidr_block" {
  type          = "string"
  description   = "Dev VPC Subnet 2 CIDR Block"
}
# STUB Dev Subnet 3 CIDR Block
variable "dev_subnet3_cidr_block" {
  type          = "string"
  description   = "Dev VPC Subnet 3 CIDR Block"
}
