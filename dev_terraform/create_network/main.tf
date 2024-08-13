terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "dev-cle-network-terraform-state"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
    encrypt = true
  }
}

module "vpc" {
  source = "./vpc"
}

module "subnet" {
  source = "./subnet"
  vpc_id = module.vpc.vpc_id
}

module "internet_gateway" {
  source = "./internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source = "./security_group"
  vpc_id = module.vpc.vpc_id
  cidr_blocks = var.cidr_blocks
}

module "route_table" {
  source = "./route_table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.internet_gateway.igw_id
  subnet_id = module.subnet.subnet_id
}
