output "clb-name" {
  value = aws_elb.lb.name
}

output "dns" {
  value = aws_elb.lb.dns_name
}
