variable "public_subnet_id" {
  description = "ID of the public subnet where the NAT Gateway will be placed"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of VPC"
  type        = string
}