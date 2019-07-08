# ANCHOR AZ Data Source
# Getting list of Availability Zones in the current region.
# NOTE As of June 2019, Transit Gateway works only in one region. So, each VPC must be in same region.
data "aws_availability_zones" "available" {
  provider = "aws.lab"
}


# ANCHOR Subnets

# STUB Edge Public Subnets
# Lab Account - Edge VPC Public Subnet 1
resource "aws_subnet" "edge_public1" {
  provider          = "aws.lab"
  vpc_id            = "${var.edge_id}"
  cidr_block        = "${var.edge_public1_cidr_block}" // 10.10.10.0/24
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name = "edge_public1"
    Team = "cloud_infrastructure"
  }
}
# Lab Account - Edge VPC Public Subnet 2
resource "aws_subnet" "edge_public2" {
  provider          = "aws.lab"
  vpc_id            = "${var.edge_id}"
  cidr_block        = "${var.edge_public2_cidr_block}" // 10.10.20.0/24
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "edge_public2"
    Team = "cloud_infrastructure"
  }
}
# Lab Account - Edge VPC Public Subnet 3
resource "aws_subnet" "edge_public3" {
  provider          = "aws.lab"
  vpc_id            = "${var.edge_id}"
  cidr_block        = "${var.edge_public3_cidr_block}" // 10.10.30.0/24
  availability_zone = "${data.aws_availability_zones.available.names[2]}"

  tags = {
    Name = "edge_public3"
    Team = "cloud_infrastructure"
  }
}

# STUB Edge Private Subnets
# Lab Account - Edge VPC Private Subnet 1
resource "aws_subnet" "edge_private1" {
  provider          = "aws.lab"
  vpc_id            = "${var.edge_id}"
  cidr_block        = "${var.edge_private1_cidr_block}" // 10.10.40.0/24
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name = "edge_private1"
    Team = "cloud_infrastructure"
  }
}
# Lab Account - Edge VPC Private Subnet 2
resource "aws_subnet" "edge_private2" {
  provider          = "aws.lab"
  vpc_id            = "${var.edge_id}"
  cidr_block        = "${var.edge_private2_cidr_block}" // 10.10.50.0/24
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "edge_private2"
    Team = "cloud_infrastructure"
  }
}
# Lab Account - Edge VPC Private Subnet 3
resource "aws_subnet" "edge_private3" {
  provider          = "aws.lab"
  vpc_id            = "${var.edge_id}"
  cidr_block        = "${var.edge_private3_cidr_block}" // 10.10.60.0/24
  availability_zone = "${data.aws_availability_zones.available.names[2]}"

  tags = {
    Name = "edge_private3"
    Team = "cloud_infrastructure"
  }
}

# STUB Tools Subnets
# Lab Account - Tools VPC Subnet 1
resource "aws_subnet" "tools_subnet1" {
  provider = "aws.lab"
  vpc_id = "${var.tools_id}"
  cidr_block = "${var.tools_subnet1_cidr_block}" // 10.20.10.0/24

  # availability_zone = "us-west-2a"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name = "tools_subnet1"
    Team = "cloud_infrastructure"
  }
}
# Lab Account - Tools VPC Subnet 2
resource "aws_subnet" "tools_subnet2" {
  provider = "aws.lab"
  vpc_id = "${var.tools_id}"
  cidr_block = "${var.tools_subnet2_cidr_block}" // 10.20.20.0/24

  # availability_zone = "us-west-2b"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "tools_subnet2"
    Team = "cloud_infrastructure"
  }
}
# Lab Account - Tools VPC Subnet 3
resource "aws_subnet" "tools_subnet3" {
  provider = "aws.lab"
  vpc_id = "${var.tools_id}"
  cidr_block = "${var.tools_subnet3_cidr_block}" // 10.20.30.0/24

  # availability_zone = "us-west-2c"
  availability_zone = "${data.aws_availability_zones.available.names[2]}"

  tags = {
    Name = "tools_subnet3"
    Team = "cloud_infrastructure"
  }
}

# STUB Dev Subnets
# Dev Account - Dev VPC Subnet 1
resource "aws_subnet" "dev_subnet1" {
  provider = "aws.dev"
  vpc_id = "${var.dev_id}"
  cidr_block = "${var.dev_subnet1_cidr_block}" // 10.30.10.0/24

  # availability_zone = "us-west-2a"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name = "dev_subnet1"
    Team = "cloud_infrastructure"
  }
}
# Dev Account - Dev VPC Subnet 2
resource "aws_subnet" "dev_subnet2" {
  provider = "aws.dev"
  vpc_id = "${var.dev_id}"
  cidr_block = "${var.dev_subnet2_cidr_block}" // 10.30.20.0/24

  # availability_zone = "us-west-2b"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "dev_subnet2"
    Team = "cloud_infrastructure"
  } 
}
# Dev Account - Dev VPC Subnet 3
resource "aws_subnet" "dev_subnet3" {
  provider = "aws.dev"
  vpc_id = "${var.dev_id}"
  cidr_block = "${var.dev_subnet3_cidr_block}" // 10.30.30.0/24

  # availability_zone = "us-west-2c"
  availability_zone = "${data.aws_availability_zones.available.names[2]}"

  tags = {
    Name = "dev_subnet3"
    Team = "cloud_infrastructure"
  } 
}