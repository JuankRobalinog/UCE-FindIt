variable "aws_region" {
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  default     = "UCE-FindIt"
}

variable "environment" {
  type        = string
  default     = "qa"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}
