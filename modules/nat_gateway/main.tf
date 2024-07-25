resource "aws_eip" "nat" {
    domain = "vpc"
}

resource "aws_nat_gateway" "myNATGW" {
    allocation_id = aws_eip.nat.id
    subnet_id = var.public_subnet_id

    tags = {
      Name = "myNATGW"
    }
}

resource "aws_route_table" "private_rtb" {
    vpc_id = var.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.myNATGW.id
    }

    tags = {
      Name = "private_rtb"
    }
}

resource "aws_route_table_association" "private_rtb_1x" {
    count = length(var.private_subnet_ids)
    subnet_id = var.private_subnet_ids[count.index]
    route_table_id = aws_route_table.private_rtb.id
}