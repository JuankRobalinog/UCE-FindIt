# Security Group específico para el Bastión
resource "aws_security_group" "bastion_sg" {
  name   = "uce-findit-bastion-sg"
  vpc_id = var.vpc_id

  # Puerta para Web (API Gateway)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Puerta para SSH (Tu conexión)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Salida permitida a todo el mundo (Para que Docker descargue cosas)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Instancia EC2 del Bastión
resource "aws_instance" "this" {
  ami                         = "ami-0440d3b780d96b29d" # Amazon Linux 2023
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true # <--- OBLIGATORIO PARA QUE NO SALGA EN ROJO

  tags = {
    Name = "Bastion-Host-UCE"
  }
}