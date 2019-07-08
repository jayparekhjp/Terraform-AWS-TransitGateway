# ANCHOR S3 Bucket
# Creating S3 buckets to store the flow logs of all VPCs.

# STUB Edge S3
resource "aws_s3_bucket" "edge_s3" {
  provider      = "aws.lab"
  bucket        = "jp-edge-vpc-flow-logs"
  force_destroy = true
}

# STUB Tools S3
resource "aws_s3_bucket" "tools_s3" {
  provider      = "aws.lab"
  bucket        = "jp-tools-vpc-flow-logs"
  force_destroy = true
}

# STUB Dev S3
resource "aws_s3_bucket" "dev_s3" {
  provider      = "aws.dev"
  bucket        = "jp-dev-vpc-flow-logs"
  force_destroy = true
}


# ANCHOR VPC Flow Logs
# Creating flow logs for all VPCs to monitor the traffic path and understand routing better.

# STUB Edge Flow Logs
resource "aws_flow_log" "edge" {
  provider             = "aws.lab"
  log_destination      = "${aws_s3_bucket.edge_s3.arn}"
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = "${var.edge_id}"
}

# STUB Tools Flow Logs
resource "aws_flow_log" "tools" {
  provider             = "aws.lab"
  log_destination      = "${aws_s3_bucket.tools_s3.arn}"
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = "${var.tools_id}"
}

# STUB Dev Flow Logs
resource "aws_flow_log" "dev" {
  provider             = "aws.dev"
  log_destination      = "${aws_s3_bucket.dev_s3.arn}"
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = "${var.dev_id}"
}
