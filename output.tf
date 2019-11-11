output "vpc_id" {
  value = module.myvpc.vpc_id
}
output "subnet_id" {
  value = module.myvpc.subnet_id
}
output "DNS" {
  value = module.myec2.dns
}
