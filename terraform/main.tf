terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

 provider "aws" {
  region     = var.aws_region
  access_key = var.access_key  
  secret_key = var.secret_key  
  token      = var.token     
}

resource "aws_vpc" "uce_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.uce_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-public-subnet"
  }
}

# --- LLAMADA AL MÓDULO DEL BASTIÓN ---

module "bastion_host" {
  source           = "./modules/bastion"
  vpc_id           = aws_vpc.uce_vpc.id
  public_subnet_id = aws_subnet.public_1.id
  instance_type    = var.instance_type
}