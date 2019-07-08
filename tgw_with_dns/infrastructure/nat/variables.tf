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

# ANCHOR Subnet ID

# STUB Edge Public 2 ID
variable "edge_public2_id" {
  type        = "string"
  description = "Edge VPC Public Subnet 2 ID"
}
