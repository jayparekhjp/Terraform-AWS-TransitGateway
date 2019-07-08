# ANCHOR RAM

# STUB RAM Resource Share
# Lab Account - RAM Resource Share Creation
resource "aws_ram_resource_share" "tgw_ram_share" {
  provider                  = "aws.lab"
  name                      = "tgw_ram_share"
  allow_external_principals = true

  tags = {
    Name = "tgw_ram_share"
    Team = "cloud_infrastructure"
  }
}

# STUB RAM Resource Association
# Lab Account - TGW RAM Resource Association
resource "aws_ram_resource_association" "tgw_ram_association" {
  provider           = "aws.lab"
  resource_arn       = "${var.tgw_arn}"
  resource_share_arn = "${aws_ram_resource_share.tgw_ram_share.arn}"

  depends_on = ["var.tgw"]
}

# STUB RAM Principal Association
# Lab Account - TGW RAM Share with Dev Account
resource "aws_ram_principal_association" "tgw_share_dev" {
  provider           = "aws.lab"
  principal          = "662113885739"
  resource_share_arn = "${aws_ram_resource_share.tgw_ram_share.arn}"
}
