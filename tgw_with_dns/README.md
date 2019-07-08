# **AWS Terraform - Transit Gateway POC**

This is a multi account deployment. To deploy this module, create a **.tfvars** file with assume role ARNs of two account or pass the ARNs via terraform CLI.

## terraform.tfvars

`lab_assume_role = "ARN OF 1ST ACCOUNT(LAB ACCOUNT)"`

`dev_assume_role = "ARN OF 2ND ACCOUNT(DEV ACCOUNT)"`

## Commands

`terraform plan -out "plan"`

`terraform apply "plan"`

![two_accounts_transit_gateway](/tgw_with_dns/tgw_with_dns.jpg)
