resource "aws_security_group" "bastion_sg" {
    name = "bastion_sg"
    description = "Security group for bastion host"
    vpc_id = var.vpc_id

    ingress {
        description = "SSH from anywhere"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "bastion_sg"
    }
}

resource "aws_security_group" "private_instance_sg" {
    name = "private_instance_sg"
    description = "Security group for private_instance"
    vpc_id = var.vpc_id

    ingress {
        description = "SSH from bastion host"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = [aws_security_group.bastion_sg.id]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["10.1.0.0/16"]
    }

    tags = {
      Name = "private_instance_sg"
    }
}

