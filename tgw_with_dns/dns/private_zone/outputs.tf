# ANCHOR Private Zones

# STUB US1 Zone
output "us1_dns_zone_id" {
  value = "${aws_route53_zone.us1.id}"
}