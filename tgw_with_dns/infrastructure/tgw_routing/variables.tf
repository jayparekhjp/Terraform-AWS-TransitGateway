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

# ANCHOR TGW Attachments

# STUB Edge TGW Attachment
variable "edge_attachment" {
  type        = "string"
  description = "Edge Attachment ID"
}
# STUB Tools TGW Attachment
variable "tools_attachment" {
  type        = "string"
  description = "Tools Attachment ID"
}
# STUB Dev TGW Attachment
variable "dev_attachment" {
  type        = "string"
  description = "Dev Attachment ID"
}

# ANCHOR TGW Attachment Accepter
# STUB Dev TGW Attachment Accepter
variable "dev_attachment_accepter" {
  type        = "string"
  description = "Dev Attachment Accepter ID"
}

# ANCHOR VPC CIDR Blocks

# STUB Edge VPC CIDR Block
variable "edge_cidr_block" {
  type        = "string"
  description = "Edge VPC CIDR Block"
}
# STUB Tools VPC CIDR Block
variable "tools_cidr_block" {
  type        = "string"
  description = "Tools VPC CIDR Block"
}
# STUB Dev VPC CIDR Block
variable "dev_cidr_block" {
  type        = "string"
  description = "Dev VPC CIDR Block"
}

# ANCHOR RAM Resource Association

# STUB TGW Resource Association ID
variable "ram_resource_association" {
  type        = "string"
  description = "Transit Gateway RAM Resource Association"
}
# STUB TGW Principal Association ID
variable "ram_principal_association" {
  type        = "string"
  description = "Transit Gateway RAM Principal Association"
}