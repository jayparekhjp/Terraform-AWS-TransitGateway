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

# ANCHOR Transit Gateway

# STUB Transit Gateway ID
variable "tgw" {
  type        = "string"
  description = "Transit Gateway ID"
}
# STUB Transit Gateway ARN
variable "tgw_arn" {
  type        = "string"
  description = "Transit Gateway ARN"
}