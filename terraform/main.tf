# terraform/main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Definimos la región (Virginia es la más común y económica)
provider "aws" {
  region = "us-east-1"
}

# Ejemplo: Crear una instancia EC2 básica para el servidor de UCE FindIt
resource "aws_instance" "backend_server" {
  ami           = "ami-0c101f26f147fa7fd" # Amazon Linux 2 (Free Tier)
  instance_type = "t2.micro"

  tags = {
    Name        = "UCE-FindIt-Server"
    Environment = "QA"
  }
}ECHO est� activado.
