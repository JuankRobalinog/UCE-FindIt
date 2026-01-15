# Security Group specific for Bastión
resource "aws_security_group" "bastion_sg" {
  name   = "uce-findit-bastion-sg"
  vpc_id = var.vpc_id

 ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"] # cambiar por razones de seguridad.
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 of Bastión
resource "aws_instance" "this" {
  ami           = "ami-0440d3b780d96b29d" # Amazon Linux 2
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = { Name = "Bastion-Host-UCE" }
}