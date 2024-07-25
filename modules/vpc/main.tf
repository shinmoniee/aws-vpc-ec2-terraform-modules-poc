resource "aws_vpc" "vpc_a" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Name = "VPC_A"
    }
}

resource "aws_internet_gateway" "VPC_A_IGW" {
    vpc_id = aws_vpc.vpc_a.id

    tags = {
        Name = "VPC_A_IGW"
    }
}