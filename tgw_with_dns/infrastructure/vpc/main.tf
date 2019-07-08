# ANCHOR VPCs

# STUB Edge VPC
# Lab Account - Edge VPC
resource "aws_vpc" "edge" {
  provider              = "aws.lab"
  cidr_block            = "${var.edge_cidr_block}"
  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name  = "edge_vpc"
    Team  = "cloud_infrastructure"
  }
}

# STUB Tools VPC
# Lab Account - Tools VPC
resource "aws_vpc" "tools" {
  provider              = "aws.lab"
  cidr_block            = "${var.tools_cidr_block}"
  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name = "tools_vpc"
    Team = "cloud_infrastructure"
  }
}

# STUB Dev VPC
# Dev Account - Dev VPC
resource "aws_vpc" "dev" {
  provider              = "aws.dev"
  cidr_block            = "${var.dev_cidr_block}"
  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name = "dev_vpc"
    Team = "cloud_infrastructure"
  }
}
