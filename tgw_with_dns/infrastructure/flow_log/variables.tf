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

# ANCHOR VPC ID

# Edge VPC ID
variable "edge_id" {
  type        = "string"
  description = "Edge VPC ID to deploy IGW"
}

# Tools VPC ID
variable "tools_id" {
  type        = "string"
  description = "Tools VPC ID to deploy IGW"
}

# Dev VPC ID
variable "dev_id" {
  type        = "string"
  description = "Dev VPC ID to deploy IGW"
}
