variable "vpc_id" {
  description = "ID of VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of public subnet for bastion host"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of private subnet for private instance"
  type        = string
}

variable "bastion_sg_id" {
  description = "ID of security group for bastion host"
  type        = string
}

variable "private_instance_sg_id" {
  description = "ID of security group for private instance"
  type        = string
}

variable "bastion_ami" {
  description = "AMI ID for bastion host"
  type        = string
}

variable "private_instance_ami" {
  description = "AMI ID for private instance"
  type        = string
}

variable "bastion_instancetype" {
  description = "Instance type for bastion host"
  type        = string
  default     = "t2.micro"
}

variable "private_instance_instancetype" {
  description = "Instance type for private instance"
  type        = string
  default     = "t2.micro"
}