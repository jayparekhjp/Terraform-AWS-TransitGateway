# ANCHOR VPC Security Groups

# STUB Edge SG
# Lab Account - Edge Security Group
resource "aws_security_group" "edge_sg1" {
  provider = "aws.lab"
  name     = "edge_sg1"
  vpc_id   = "${var.edge_id}"

  tags = {
    Name = "edge_sg1"
    Team = "cloud_infrastructure"
  }
}
# Lab Account - Edge Security Group
resource "aws_security_group" "edge_sg2" {
  provider = "aws.lab"
  name     = "edge_sg2"
  vpc_id   = "${var.edge_id}"

  tags = {
    Name = "edge_sg2"
    Team = "cloud_infrastructure"
  }
}

# STUB Tools SG
# Lab Account - Tools Security Group
resource "aws_security_group" "tools_sg1" {
  provider = "aws.lab"
  name     = "tools_sg1"
  vpc_id   = "${var.tools_id}"

  tags = {
    Name = "tools_sg1"
    Team = "cloud_infrastructure"
  }
}

# STUB Dev SG
# Dev Account - Dev Security Group
resource "aws_security_group" "dev_sg1" {
  provider = "aws.dev"
  name     = "dev_sg1"
  vpc_id   = "${var.dev_id}"

  tags = {
    Name = "dev_sg1"
    Team = "cloud_infrastructure"
  }
}

# ANCHOR SG Rules

# STUB Edge SG1 Rules
# Lab Account - Edge SG Egress for Internet
resource "aws_security_group_rule" "edge_sg1_internet" {
  provider  = "aws.lab"
  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"

  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.edge_sg1.id}"
}
# Lab Account - Edge SG Ingress for Ping
resource "aws_security_group_rule" "edge_sg1_ping" {
  provider  = "aws.lab"
  type      = "ingress"
  from_port = -1
  to_port   = -1
  protocol  = "icmp"

  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.edge_sg1.id}"
}
# Lab Account - Edge SG Ingress for SSH
resource "aws_security_group_rule" "edge_sg1_ssh" {
  provider  = "aws.lab"
  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"

  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.edge_sg1.id}"
}

# STUB Edge SG2 Rules
# Lab Account - Edge SG Egress for Internet
resource "aws_security_group_rule" "edge_sg2_internet" {
  provider  = "aws.lab"
  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"

  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.edge_sg2.id}"
}
# Lab Account - Edge SG Ingress for Ping
resource "aws_security_group_rule" "edge_sg2_ping" {
  provider  = "aws.lab"
  type      = "ingress"
  from_port = -1
  to_port   = -1
  protocol  = "icmp"

  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.edge_sg2.id}"
}
# Lab Account - Edge SG Ingress for SSH
resource "aws_security_group_rule" "edge_sg2_ssh" {
  provider  = "aws.lab"
  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"

  cidr_blocks       = ["10.10.0.0/16"]
  security_group_id = "${aws_security_group.edge_sg2.id}"
}

# STUB Tools SG1 Rules
# Lab Account - Tools SG Egress for Internet
resource "aws_security_group_rule" "tools_sg1_internet" {
  provider  = "aws.lab"
  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"

  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.tools_sg1.id}"
}
# Lab Account - Tools SG Ingress for Ping
resource "aws_security_group_rule" "tools_sg1_ping" {
  provider  = "aws.lab"
  type      = "ingress"
  from_port = -1
  to_port   = -1
  protocol  = "icmp"

  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.tools_sg1.id}"
}
# Lab Account - Tools SG Ingress for SSH - Edge Only
resource "aws_security_group_rule" "tools_sg1_ssh" {
  provider  = "aws.lab"
  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"

  cidr_blocks       = ["${var.edge_cidr_block}"]
  security_group_id = "${aws_security_group.tools_sg1.id}"
}

# STUB Dev SG1 Rules
# Dev Account - Dev SG Egress for Internet
resource "aws_security_group_rule" "dev_sg1_internet" {
  provider  = "aws.dev"
  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"

  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.dev_sg1.id}"
}
# Dev Account - Dev SG Ingress for Ping
resource "aws_security_group_rule" "dev_sg1_ping" {
  provider  = "aws.dev"
  type      = "ingress"
  from_port = -1
  to_port   = -1
  protocol  = "icmp"

  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.dev_sg1.id}"
}
# Dev Account - Dev SG Ingress for SSH - Edge Only
resource "aws_security_group_rule" "dev_sg1_ssh" {
  provider  = "aws.dev"
  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"

  cidr_blocks       = ["${var.edge_cidr_block}"]
  security_group_id = "${aws_security_group.dev_sg1.id}"
}
