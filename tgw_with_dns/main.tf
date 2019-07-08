# ANCHOR --- Provider ---

# ANCHOR Region
provider "aws" {
  region = "us-west-2"
}

# ANCHOR VPC Module
module "vpc" {
  source           = "./infrastructure/vpc"
  lab_role         = "${var.lab_assume_role}"
  dev_role         = "${var.dev_assume_role}"
  edge_cidr_block  = "10.10.0.0/16"
  tools_cidr_block = "10.20.0.0/16"
  dev_cidr_block   = "10.30.0.0/16"
}

# ANCHOR Flow Logs Module
module "flow_log" {
  source   = "./infrastructure/flow_log"
  lab_role = "${var.lab_assume_role}"
  dev_role = "${var.dev_assume_role}"
  edge_id  = "${module.vpc.edge_id}"
  tools_id = "${module.vpc.tools_id}"
  dev_id   = "${module.vpc.dev_id}"
}


# ANCHOR Subnet Module
module "subnet" {
  source                   = "./infrastructure/subnet"
  lab_role                 = "${var.lab_assume_role}"
  dev_role                 = "${var.dev_assume_role}"
  edge_id                  = "${module.vpc.edge_id}"
  tools_id                 = "${module.vpc.tools_id}"
  dev_id                   = "${module.vpc.dev_id}"
  edge_public1_cidr_block  = "10.10.10.0/24"
  edge_public2_cidr_block  = "10.10.20.0/24"
  edge_public3_cidr_block  = "10.10.30.0/24"
  edge_private1_cidr_block = "10.10.40.0/24"
  edge_private2_cidr_block = "10.10.50.0/24"
  edge_private3_cidr_block = "10.10.60.0/24"
  tools_subnet1_cidr_block = "10.20.10.0/24"
  tools_subnet2_cidr_block = "10.20.20.0/24"
  tools_subnet3_cidr_block = "10.20.30.0/24"
  dev_subnet1_cidr_block   = "10.30.10.0/24"
  dev_subnet2_cidr_block   = "10.30.20.0/24"
  dev_subnet3_cidr_block   = "10.30.30.0/24"
}

# ANCHOR Internet Gateway Module
module "igw" {
  source   = "./infrastructure/igw"
  lab_role = "${var.lab_assume_role}"
  dev_role = "${var.dev_assume_role}"
  edge_id  = "${module.vpc.edge_id}"
}

# ANCHOR NAT Gateway Module
module "nat" {
  source          = "./infrastructure/nat"
  lab_role        = "${var.lab_assume_role}"
  dev_role        = "${var.dev_assume_role}"
  edge_public2_id = "${module.subnet.edge_public2_id}"
}


# ANCHOR Route Table Module
module "route_table" {
  source           = "./infrastructure/route_table"
  lab_role         = "${var.lab_assume_role}"
  dev_role         = "${var.dev_assume_role}"
  edge_id          = "${module.vpc.edge_id}"
  tools_id         = "${module.vpc.tools_id}"
  dev_id           = "${module.vpc.dev_id}"
  edge_public1_id  = "${module.subnet.edge_public1_id}"
  edge_public2_id  = "${module.subnet.edge_public2_id}"
  edge_public3_id  = "${module.subnet.edge_public3_id}"
  edge_private1_id = "${module.subnet.edge_private1_id}"
  edge_private2_id = "${module.subnet.edge_private2_id}"
  edge_private3_id = "${module.subnet.edge_private3_id}"
  tools_subnet1_id = "${module.subnet.tools_subnet1_id}"
  tools_subnet2_id = "${module.subnet.tools_subnet2_id}"
  tools_subnet3_id = "${module.subnet.tools_subnet3_id}"
  dev_subnet1_id   = "${module.subnet.dev_subnet1_id}"
  dev_subnet2_id   = "${module.subnet.dev_subnet2_id}"
  dev_subnet3_id   = "${module.subnet.dev_subnet2_id}"
}

# ANCHOR Transit Gateway Module
module "tgw" {
  source   = "./infrastructure/tgw"
  lab_role = "${var.lab_assume_role}"
  dev_role = "${var.dev_assume_role}"
}

# ANCHOR RAM Module
module "ram" {
  source   = "./infrastructure/ram"
  lab_role = "${var.lab_assume_role}"
  dev_role = "${var.dev_assume_role}"
  tgw      = "${module.tgw.tgw}"
  tgw_arn  = "${module.tgw.tgw_arn}"
}

# ANCHOR  Transit Gateway VPC Attachments Module
module "tgw_attachments" {
  source           = "./infrastructure/tgw_attachments"
  lab_role         = "${var.lab_assume_role}"
  dev_role         = "${var.dev_assume_role}"
  tgw              = "${module.tgw.tgw}"
  edge_id          = "${module.vpc.edge_id}"
  tools_id         = "${module.vpc.tools_id}"
  dev_id           = "${module.vpc.dev_id}"
  edge_public1_id  = "${module.subnet.edge_public1_id}"
  edge_public2_id  = "${module.subnet.edge_public2_id}"
  edge_public3_id  = "${module.subnet.edge_public3_id}"
  edge_private1_id = "${module.subnet.edge_private1_id}"
  edge_private2_id = "${module.subnet.edge_private2_id}"
  edge_private3_id = "${module.subnet.edge_private3_id}"
  tools_subnet1_id = "${module.subnet.tools_subnet1_id}"
  tools_subnet2_id = "${module.subnet.tools_subnet2_id}"
  tools_subnet3_id = "${module.subnet.tools_subnet3_id}"
  dev_subnet1_id   = "${module.subnet.dev_subnet1_id}"
  dev_subnet2_id   = "${module.subnet.dev_subnet2_id}"
  dev_subnet3_id   = "${module.subnet.dev_subnet3_id}"
}

# ANCHOR VPC Routing Module
module "vpc_routing" {
  source            = "./infrastructure/vpc_routing"
  lab_role          = "${var.lab_assume_role}"
  dev_role          = "${var.dev_assume_role}"
  igw               = "${module.igw.igw}"
  tgw               = "${module.tgw.tgw}"
  nat               = "${module.nat.edge_nat_id}"
  edge_network_acl  = "${module.vpc.edge_network_acl}"
  tools_network_acl = "${module.vpc.tools_network_acl}"
  dev_network_acl   = "${module.vpc.dev_network_acl}"
  edge_public_rt    = "${module.route_table.edge_public_rt}"
  edge_private_rt   = "${module.route_table.edge_private_rt}"
  tools_rt1         = "${module.route_table.tools_rt1}"
  dev_rt1           = "${module.route_table.dev_rt1}"
  edge_cidr_block   = "${module.vpc.edge_cidr_block}"
  tools_cidr_block  = "${module.vpc.tools_cidr_block}"
  dev_cidr_block    = "${module.vpc.dev_cidr_block}"
  edge_attachment   = "${module.tgw_attachments.edge_attachment}"
  tools_attachment  = "${module.tgw_attachments.tools_attachment}"
  dev_attachment    = "${module.tgw_attachments.dev_attachment}"
  tools_subnet1_id  = "${module.subnet.tools_subnet1_id}"
  tools_subnet2_id  = "${module.subnet.tools_subnet2_id}"
  tools_subnet3_id  = "${module.subnet.tools_subnet3_id}"
  dev_subnet1_id    = "${module.subnet.dev_subnet1_id}"
  dev_subnet2_id    = "${module.subnet.dev_subnet2_id}"
  dev_subnet3_id    = "${module.subnet.dev_subnet3_id}"

  # Inter Module Dependency Workaround
  depends_on_list = ["${module.ram.ram_resource_association}", "${module.ram.ram_principal_association}", "${module.tgw.tgw}"]
}

# ANCHOR Transit Gateway Routing Module
module "tgw_routing" {
  source                    = "./infrastructure/tgw_routing"
  lab_role                  = "${var.lab_assume_role}"
  dev_role                  = "${var.dev_assume_role}"
  tgw                       = "${module.tgw.tgw}"
  edge_attachment           = "${module.tgw_attachments.edge_attachment}"
  tools_attachment          = "${module.tgw_attachments.tools_attachment}"
  dev_attachment            = "${module.tgw_attachments.dev_attachment}"
  dev_attachment_accepter   = "${module.tgw_attachments.dev_attachment_accepter}"
  edge_cidr_block           = "${module.vpc.edge_cidr_block}"
  tools_cidr_block          = "${module.vpc.tools_cidr_block}"
  dev_cidr_block            = "${module.vpc.dev_cidr_block}"
  ram_resource_association  = "${module.ram.ram_resource_association}"
  ram_principal_association = "${module.ram.ram_principal_association}"
}

# ANCHOR Route 53 Zone Module
module "dns_zone" {
  source   = "./dns/private_zone"
  lab_role = "${var.lab_assume_role}"
  dev_role = "${var.dev_assume_role}"
  edge_id  = "${module.vpc.edge_id}"
  tools_id = "${module.vpc.tools_id}"
  dev_id   = "${module.vpc.dev_id}"
}

# ANCHOR --- Consumer ---

# ANCHOR SG Module
module "sec_group" {
  source           = "./ec2/sec_group"
  lab_role         = "${var.lab_assume_role}"
  dev_role         = "${var.dev_assume_role}"
  edge_id          = "${module.vpc.edge_id}"
  tools_id         = "${module.vpc.tools_id}"
  dev_id           = "${module.vpc.dev_id}"
  edge_cidr_block  = "${module.vpc.edge_cidr_block}"
  tools_cidr_block = "${module.vpc.tools_cidr_block}"
  dev_cidr_block   = "${module.vpc.dev_cidr_block}"
}

# ANCHOR EC2 Module
module "ec2" {
  source                 = "./ec2/compute"
  lab_role               = "${var.lab_assume_role}"
  dev_role               = "${var.dev_assume_role}"
  instance_type          = "t2.micro"
  edge_public_subnet_id  = "${module.subnet.edge_public2_id}"
  edge_private_subnet_id = "${module.subnet.edge_private2_id}"
  tools_subnet_id        = "${module.subnet.tools_subnet2_id}"
  dev_subnet_id          = "${module.subnet.dev_subnet2_id}"
  edge_sg1_id            = "${module.sec_group.edge_sg1}"
  edge_sg2_id            = "${module.sec_group.edge_sg2}"
  tools_sg_id            = "${module.sec_group.tools_sg1}"
  dev_sg_id              = "${module.sec_group.dev_sg1}"
  lab_key                = "jp-tele-tracking"
  dev_key                = "jp-poc-dev"
  us1_dns_zone_id        = "${module.dns_zone.us1_dns_zone_id}"
  # edge_dns_zone_id       = "${module.dns_zone.edge_dns_zone_id}"
  # tools_dns_zone_id      = "${module.dns_zone.tools_dns_zone_id}"
  # dev_dns_zone_id        = "${module.dns_zone.dev_dns_zone_id}"
}
