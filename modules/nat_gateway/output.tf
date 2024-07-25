output "nat_gateway_id" {
    description = "ID of NAT Gateway"
    value = aws_nat_gateway.myNATGW.id
}

output "nat_gateway_public_ip" {
    description = "public IP address of NAT Gateway"
    value = aws_eip.nat.public_ip
}