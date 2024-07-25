output "bastion_public_ip" {
  description = "Public IP address of bastion host"
  value       = aws_instance.bastion_host.public_ip
}

output "bastion_private_ip" {
  description = "Private IP address of bastion host"
  value       = aws_instance.bastion_host.private_ip
}

output "private_instance_private_ip" {
  description = "Private IP address of private instance"
  value       = aws_instance.myprivate_instance.private_ip
}

output "bastion_instanceid" {
  description = "Instance ID of bastion host"
  value       = aws_instance.bastion_host.id
}

output "private_instance_instanceid" {
  description = "Instance ID of private instance"
  value       = aws_instance.myprivate_instance.id
}