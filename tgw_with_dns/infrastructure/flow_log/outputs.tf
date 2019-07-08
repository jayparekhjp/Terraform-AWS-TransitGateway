# ANCHOR Flow Logs Bucket IDs

output "edge_bucket" {
  value = "${aws_s3_bucket.edge_s3.id}"
}

output "tools_bucket" {
  value = "${aws_s3_bucket.tools_s3.id}"
}

output "dev_bucket" {
  value = "${aws_s3_bucket.dev_s3.id}"
}


# ANCHOR Flow Logs

output "edge_flow_log_id" {
  value = "${aws_flow_log.edge.id}"
}

output "tools_flow_log_id" {
  value = "${aws_flow_log.tools.id}"
}

output "dev_flow_log_id" {
  value = "${aws_flow_log.dev.id}"
}
