output "vpc_id" {
    description = "ID of VPC"
    value = aws_vpc.vpc_a.id
}

output "internet_gateway_id" {
    description = "ID of Internet Gateway"
    value = aws_internet_gateway.VPC_A_IGW.id
}