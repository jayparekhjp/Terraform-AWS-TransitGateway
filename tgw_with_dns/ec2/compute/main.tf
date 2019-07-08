provider "aws" {
  region = "us-west-2"
}


# ANCHOR Instance AMI

# STUB Amazon Linux AMI
# Lab Account - Amazon Linux AMI
data "aws_ami" "amazon_linux_lab" {
  provider    = "aws.lab"
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# ANCHOR Instances

# STUB Edge Instance
# Lab Account - Edge Instance - Public
resource "aws_instance" "edge_public_instance" {
  provider = "aws.lab"
  # ami      = "${data.aws_ami.amazon_linux_lab.id}"
  ami           = "ami-07669fc90e6e6cc47"
  instance_type = "${var.instance_type}"

  associate_public_ip_address = true

  subnet_id              = "${var.edge_public_subnet_id}"
  vpc_security_group_ids = ["${var.edge_sg1_id}"]

  key_name = "${var.lab_key}"

  tags = {
    Name = "edge_public_instance"
    Team = "cloud_infrasturcture"
  }
}
# Lab Account - Edge Instance - Private
resource "aws_instance" "edge_private_instance" {
  provider = "aws.lab"
  # ami      = "${data.aws_ami.amazon_linux_lab.id}"
  ami           = "ami-07669fc90e6e6cc47"
  instance_type = "${var.instance_type}"

  associate_public_ip_address = false

  subnet_id              = "${var.edge_private_subnet_id}"
  vpc_security_group_ids = ["${var.edge_sg2_id}"]

  key_name = "${var.lab_key}"

  tags = {
    Name = "edge_private_instance"
    Team = "cloud_infrasturcture"
  }
}


# STUB Tools Instance
# Lab Account - Tools Instance - Private
resource "aws_instance" "tools_instance" {
  provider = "aws.lab"
  # ami      = "${data.aws_ami.amazon_linux_lab.id}"
  ami           = "ami-07669fc90e6e6cc47"
  instance_type = "${var.instance_type}"

  associate_public_ip_address = false

  subnet_id              = "${var.tools_subnet_id}"
  vpc_security_group_ids = ["${var.tools_sg_id}"]

  key_name = "${var.lab_key}"

  tags = {
    Name = "tools_instance"
    Team = "cloud_infrasturcture"
  }
}

# STUB Dev Instance
# Lab Account - Dev Instance - Private
resource "aws_instance" "dev_instance" {
  provider = "aws.dev"
  # ami      = "${data.aws_ami.amazon_linux_lab.id}"
  ami           = "ami-07669fc90e6e6cc47"
  instance_type = "${var.instance_type}"

  associate_public_ip_address = false

  subnet_id              = "${var.dev_subnet_id}"
  vpc_security_group_ids = ["${var.dev_sg_id}"]

  key_name = "${var.dev_key}"

  tags = {
    Name = "dev_instance"
    Team = "cloud_infrasturcture"
  }
}


# ANCHOR DNS Records

# STUB Edge Public Instance DNS Record
resource "aws_route53_record" "edge_public" {
  provider = "aws.lab"
  zone_id = "${var.us1_dns_zone_id}"
  name    = "demo.public.edge.us1.ttiq.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.edge_public_instance.private_ip}"]
}

# STUB Edge Private Instance DNS Record
resource "aws_route53_record" "edge_private" {
  provider = "aws.lab"
  zone_id = "${var.us1_dns_zone_id}"
  name    = "demo.private.edge.us1.ttiq.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.edge_private_instance.private_ip}"]
}

# STUB Tools Instance DNS Record
resource "aws_route53_record" "tools" {
  provider = "aws.lab"
  zone_id = "${var.us1_dns_zone_id}"
  name    = "demo.tools.us1.ttiq.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.tools_instance.private_ip}"]
}

# STUB Dev Instance DNS Record
resource "aws_route53_record" "dev" {
  provider = "aws.lab"
  zone_id = "${var.us1_dns_zone_id}"
  name    = "demo.dev.us1.ttiq.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.dev_instance.private_ip}"]
}
