resource "aws_instance" "bastion_host" {
    ami = var.bastion_ami
    instance_type = var.bastion_instancetype
    subnet_id = var.public_subnet_id
    vpc_security_group_ids = [ var.bastion_sg_id ]
    associate_public_ip_address = true

    tags = {
      Name = "bastion_host"
    }
}

resource "aws_instance" "myprivate_instance" {
    ami = var.private_instance_ami
    instance_type = var.private_instance_instancetype
    subnet_id = var.private_subnet_id
    vpc_security_group_ids = [ var.private_instance_sg_id ]

    tags = {
      Name = "myprivate_instance"
    }
}