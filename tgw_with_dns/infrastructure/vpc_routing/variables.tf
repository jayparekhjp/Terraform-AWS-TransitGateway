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

# ANCHOR VPC NACLs

# STUB Edge VPC NACL
variable "edge_network_acl" {
  type        = "string"
  description = "Edge VPC NACL"
}

# STUB Tools VPC NACL
variable "tools_network_acl" {
  type        = "string"
  description = "Tools VPC NACL"
}

# STUB Dev VPC NACL
variable "dev_network_acl" {
  type        = "string"
  description = "Dev VPC NACL"
}

# ANCHOR Internet Gateway

# STUB Edge IGW ID
variable "igw" {
  type        = "string"
  description = "Edge Internet Gateway ID"
}

# ANCHOR Transit Gateway

# STUB TGW ID
variable "tgw" {
  type        = "string"
  description = "Transit Gateway ID"
}

# ANCHOR NAT Gateway

# STUB TGW ID
variable "nat" {
  type        = "string"
  description = "Nat Gateway Id"
}

# ANCHOR Route Tables

# STUB Edge Public RT ID
variable "edge_public_rt" {
  type        = "string"
  description = "Edge Public Route Table ID"
}
# STUB Edge Private RT ID
variable "edge_private_rt" {
  type        = "string"
  description = "Edge Private Route Table ID"
}

# STUB Tools RT1 ID
variable "tools_rt1" {
  type        = "string"
  description = "Tools Route Table 1 ID"
}

# STUB Dev RT1 ID
variable "dev_rt1" {
  type        = "string"
  description = "Dev Route Table 1 ID"
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

# ANCHOR Dependencies

# STUB Depends On WORKAROUND
# This is a workaround for inter module dependencies. IDs of the resources are passed and stored in a list variable to depend upon.
variable "depends_on_list" {
  type        = "list"
  description = "Inter Module Dependency Workaround"
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

# ANCHOR Subnet IDs

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