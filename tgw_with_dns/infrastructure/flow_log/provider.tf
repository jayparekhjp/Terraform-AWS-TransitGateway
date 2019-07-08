# ANCHOR Provider

# STUB Lab Account
provider "aws" {
  
  region = "us-west-2"
  profile = "default"
  alias = "lab"

  assume_role {
    role_arn = "${var.lab_role}"
  }
}
# STUB Dev Account
provider "aws" {
  region  = "us-west-2"
  
  profile = "default"
  alias = "dev"

  assume_role {
    role_arn = "${var.dev_role}"
  }
}
