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


# ANCHOR VPC Variables

# STUB Edge VPC
# Edge VPC CIDR block
variable "edge_cidr_block" {
  type        = "string"
  description = "CIDR for Edge VPC"
}

# STUB Tools VPC
# Tools VPC CIDR Block
variable "tools_cidr_block" {
  type        = "string"
  description = "CIDR for Tools VPC"
}

# STUB Dev VPC
# Dev VPC CIDR Block
variable "dev_cidr_block" {
    type        = "string"
    description = "CIDR for Dev VPC"
}