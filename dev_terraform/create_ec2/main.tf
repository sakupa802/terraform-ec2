terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "dev-cle-ec2-terraform-state"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
    encrypt = true
  }
}

module "key_pair" {
  source = "./key_pair"
  key_names = var.user_names
}

module "ec2" {
  source             = "./ec2"
  instance_tags      = var.user_names
  subnet_id          = var.subnet_id
  security_group_id  = var.security_group_id
  kms_key_id         = var.kms_key_id

  depends_on = [module.key_pair]
}
