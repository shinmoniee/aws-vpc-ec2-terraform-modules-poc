variable "region" {
  default = "ap-northeast-1"
}

variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "public_subnet_1a_cidr" {
  default = "10.1.0.0/24"
}

variable "public_subnet_1b_cidr" {
  default = "10.1.1.0/24"
}

variable "private_subnet_1a_cidr" {
  default = "10.1.2.0/24"
}

variable "private_subnet_1b_cidr" {
  default = "10.1.3.0/24"
}

# variable "availability_zone_a" {
#   default = "ap-northeast-1a"
# }

# variable "availability_zone_b" {
#   default = "ap-northeast-1b"
# }

variable "bastion_ami" {
  default = "ami-0d03c6e00d5732e28"
}

variable "private_instance_ami" {
  default = "ami-0a0b7b240264a48d7"
}