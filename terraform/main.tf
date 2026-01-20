terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# --- PROVEEDOR Y RED PRINCIPAL ---

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

# --- EL PUENTE AL MUNDO (INTERNET GATEWAY) ---

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.uce_vpc.id
  tags   = { Name = "${var.project_name}-igw" }
}

# --- EL MAPA DE RUTAS (ROUTE TABLE) ---

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.uce_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

# --- LLAMADA AL MÓDULO DEL BASTIÓN ---

module "bastion_host" {
  source           = "./modules/bastion"
  vpc_id           = aws_vpc.uce_vpc.id
  public_subnet_id = aws_subnet.public_1.id
  instance_type    = var.instance_type
  key_name         = "vockey" # Asegúrate de que este nombre sea el que usa AWS Academy
}