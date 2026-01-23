output "bastion_ip" {
  value       = module.bastion_host.bastion_public_ip
  description = "La IP pública para acceder al Bastión"
}