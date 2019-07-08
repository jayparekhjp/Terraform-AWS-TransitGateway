# ANCHOR VPC Data Store
data "aws_vpc" "edge" {
  provider = "aws.lab"
  id       = "${var.edge_id}"
}
data "aws_vpc" "tools" {
  provider = "aws.lab"
  id       = "${var.tools_id}"
}
data "aws_vpc" "dev" {
  provider = "aws.dev"
  id       = "${var.dev_id}"
}

# ANCHOR Parent Private Zone

# STUB US1 Parent
resource "aws_route53_zone" "us1" {
  provider      = "aws.lab"
  name          = "us1.ttiq.com"
  force_destroy = true

  vpc {
    vpc_id     = "${data.aws_vpc.edge.id}"
    vpc_region = "us-west-2"
  }

  vpc {
    vpc_id     = "${data.aws_vpc.tools.id}"
    vpc_region = "us-west-2"
  }

  tags = {
    Name = "edge_private_zone"
    Team = "cloud_infrastructure"
  }
}

# ANCHOR Remote Zone Authorization

# STUB Dev Remote Zone Authorization
# Dev Private Zone has been created in the Edge account. It needs authorization to be used in Dev account.

resource "null_resource" "dev_zone_authorization" {

  provisioner "local-exec" {
    # command = "aws sts assume-role --role-arn ${var.lab_role} --role-session-name jp-terraform-lab-account --duration-seconds 900 && aws route53 create-vpc-association-authorization --hosted-zone-id ${aws_route53_zone.us1.zone_id} --vpc VPCRegion=us-west-2,VPCId=${var.dev_id}"
    command = "aws route53 create-vpc-association-authorization --hosted-zone-id ${aws_route53_zone.us1.zone_id} --vpc VPCRegion=us-west-2,VPCId=${var.dev_id} --profile lab"
  }
}

# ANCHOR Remote Zone Association

# STUB Dev Remote Zone Association
# Dev Private zone had been created in Edge account and Dev VPC is authorized to use it. We need to associate Dev VPC with Private Zone to use it.
resource "null_resource" "dev_zone_association" {

  provisioner "local-exec" {
    # command = "aws sts assume-role --role-arn ${var.dev_role} --role-session-name jp-terraform-dev-account --duration-seconds 900 && aws route53 associate-vpc-with-hosted-zone --hosted-zone-id ${aws_route53_zone.us1.zone_id} --vpc VPCRegion=us-west-2,VPCId=${var.dev_id}"
    command = "aws route53 associate-vpc-with-hosted-zone --hosted-zone-id ${aws_route53_zone.us1.zone_id} --vpc VPCRegion=us-west-2,VPCId=${var.dev_id} --profile dev"
  }
}
