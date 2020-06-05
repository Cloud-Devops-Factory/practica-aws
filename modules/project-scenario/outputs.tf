################################################################################
# https://www.terraform.io/docs/configuration/outputs.html

output "iam_user" {
  value = aws_iam_user.iam_user.*.name
}

output "route53_ns" {
  value = aws_route53_zone.dns_zone.name_servers
}

output "ec2_instances" {
  value = aws_instance.ec2_instance.*.id
}

output "elastic_ip" {
  value = [
    aws_instance.ec2_instance.*.public_ip,
    aws_instance.ec2_instance.*.private_ip,
  ]
}

output "dns_records_a" {
  value = [
    aws_route53_record._.name,
    aws_route53_record.public_record_a.*.name,
    aws_route53_record.private_record_a.*.name,
  ]
}

output "dashboard_url" {
  value = "https://console.aws.amazon.com/cloudwatch/home?region=${var.aws_region}#dashboards:name=${aws_cloudwatch_dashboard.cloudwatch_dashboard.dashboard_name}"
}
