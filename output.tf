output "vpc_id" {
  description = "ID of VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.subnets.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.subnets.private_subnet_ids
}

output "bastion_public_ip" {
  description = "Public IP address of bastion host"
  value       = module.instances.bastion_public_ip
}

output "private_instance_private_ip" {
  description = "Private IP address of private instance"
  value       = module.instances.private_instance_private_ip
}