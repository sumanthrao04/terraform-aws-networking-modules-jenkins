output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.subnet.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.subnet.private_subnet_ids
}

output "private_instance_id" {
  value = module.ec2.instance_id
}

output "private_instance_ip" {
  value = module.ec2.instance_private_ip
}