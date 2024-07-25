variable "vpc_id" {
  description = "ID of VPC"
  type        = string
}

variable "public_subnet_1a_cidr" {
  description = "CIDR block for public subnet 1a"
  type        = string
}

variable "public_subnet_1b_cidr" {
  description = "CIDR block for public subnet 1b"
  type        = string
}

variable "private_subnet_1a_cidr" {
  description = "CIDR block for private subnet 1a"
  type        = string
}

variable "private_subnet_1b_cidr" {
  description = "CIDR block for private subnet 1b"
  type        = string
}

# variable "availability_zone_a" {
#   description = "Availability Zone for a_subnets"
#   type        = string
# }

# variable "availability_zone_b" {
#   description = "Availability Zone for b_subnets"
#   type        = string
# }

variable "internet_gateway_id" {
  description = "ID of Internet Gateway"
  type        = string
}