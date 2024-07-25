data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public_subnet_1a" {
    vpc_id = var.vpc_id
    cidr_block = var.public_subnet_1a_cidr
    availability_zone = data.aws_availability_zones.available.names[0]

    tags = {
      Name = "public_subnet_1a"
    }
}

resource "aws_subnet" "public_subnet_1b" {
    vpc_id = var.vpc_id
    cidr_block = var.public_subnet_1b_cidr
    availability_zone = data.aws_availability_zones.available.names[1]

    tags = {
      Name = "public_subnet_1b"
    }
}

resource "aws_subnet" "private_subnet_1a" {
    vpc_id = var.vpc_id
    cidr_block = var.private_subnet_1a_cidr
    availability_zone = data.aws_availability_zones.available.names[0]

    tags = {
      Name = "private_subnet_1a"
    }
}

resource "aws_subnet" "private_subnet_1b" {
    vpc_id = var.vpc_id
    cidr_block = var.private_subnet_1b_cidr
    availability_zone = data.aws_availability_zones.available.names[1]

    tags = {
      Name = "private_subnet_1b"
    }
}

resource "aws_route_table" "public_rtb" {
    vpc_id = var.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.internet_gateway_id
    }

    tags = {
      Name = "public_rtb"
    }
}

resource "aws_route_table_association" "public_rtb_1a" {
    subnet_id = aws_subnet.public_subnet_1a.id
    route_table_id = aws_route_table.public_rtb.id
}

resource "aws_route_table_association" "public_rtb_1b" {
    subnet_id = aws_subnet.public_subnet_1b.id
    route_table_id = aws_route_table.public_rtb.id
}