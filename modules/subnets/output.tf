output "public_subnet_1a_id" {
  description = "ID of public_subnet_1a"
  value       = aws_subnet.public_subnet_1a.id
}

output "public_subnet_1b_id" {
  description = "ID of public_subnet_1b"
  value       = aws_subnet.public_subnet_1b.id
}

output "private_subnet_1a_id" {
  description = "ID of private_subnet_1a"
  value       = aws_subnet.private_subnet_1a.id
}

output "private_subnet_1b_id" {
  description = "ID of private_subnet_1b"
  value       = aws_subnet.private_subnet_1b.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [aws_subnet.public_subnet_1a.id, aws_subnet.public_subnet_1b.id]
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = [aws_subnet.private_subnet_1a.id, aws_subnet.private_subnet_1b.id]
}