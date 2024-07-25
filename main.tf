terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.59.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "subnets" {
  source                 = "./modules/subnets"
  vpc_id                 = module.vpc.vpc_id
  public_subnet_1a_cidr  = var.public_subnet_1a_cidr
  public_subnet_1b_cidr  = var.public_subnet_1b_cidr
  private_subnet_1a_cidr = var.private_subnet_1a_cidr
  private_subnet_1b_cidr = var.private_subnet_1b_cidr
  # availability_zone_a    = var.availability_zone_a
  # availability_zone_b    = var.availability_zone_b
  internet_gateway_id    = module.vpc.internet_gateway_id
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "nat_gateway" {
  source             = "./modules/nat_gateway"
  public_subnet_id   = module.subnets.private_subnet_1a_id
  private_subnet_ids = [module.subnets.private_subnet_1a_id, module.subnets.private_subnet_1b_id]
  vpc_id             = module.vpc.vpc_id
}

module "instances" {
  source                 = "./modules/instances"
  vpc_id                 = module.vpc.vpc_id
  public_subnet_id       = module.subnets.public_subnet_1b_id
  private_subnet_id      = module.subnets.private_subnet_1a_id
  bastion_sg_id          = module.security_groups.bastion_sg_id
  private_instance_sg_id = module.security_groups.private_instance_sg_id
  bastion_ami            = var.bastion_ami
  private_instance_ami   = var.private_instance_ami
}