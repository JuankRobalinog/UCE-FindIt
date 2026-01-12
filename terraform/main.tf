terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "backend_server" {
  ami           = "ami-0c101f26f147fa7fd" 
  instance_type = var.instance_type

  tags = {
    Name        = "${var.project_name}-Backend-${var.environment}"
    Environment = var.environment
  }
}