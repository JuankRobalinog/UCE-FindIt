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

# --- INTERNET GATEWAY Y RUTAS ---
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.uce_vpc.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}

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

# --- CONFIGURACIÓN DE MICROSERVICIOS ---
locals {
  services = ["gateway", "users", "items", "auth", "chat", "notif", "orders", "search", "payments", "reviews"]
}

resource "aws_instance" "microservicios" {
  for_each      = toset(local.services)
  ami           = "ami-0440d3b780d96b29d" # Amazon Linux 2023
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_1.id
  
  # Usamos el nombre del Security Group que definiste en tus capturas
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name               = "vockey" # Clave estándar de AWS Academy

  tags = {
    Name = "UceFindit-${each.key}"
  }

  # Script de inicialización corregido
  user_data = <<-EOF
              #!/bin/bash
              curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -
              dnf install -y nodejs git
              EOF
}

# --- SALIDA DE DATOS ---
output "ips_servicios" {
  description = "Lista de IPs públicas para acceder a los microservicios"
  value       = { for k, v in aws_instance.microservicios : k => v.public_ip }
}