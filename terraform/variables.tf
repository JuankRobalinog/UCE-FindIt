variable "access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "token" {
  description = "AWS Session Token"
  type        = string
}

variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  description = "Nombre del proyecto para los tags"
  type        = string
  default     = "Uce-FindIt"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}