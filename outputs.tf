# -----------------------------------------------------------------------------
# OUTPUTS
# -----------------------------------------------------------------------------

output "containers" {
  description = "A map of container objects managed by the module."
  value       = module.container.containers
}

output "networks" {
  description = "A map of network objects managed by the module."
  value       = module.network.networks
}

output "volumes" {
  description = "A map of volume objects managed by the module."
  value       = module.volume.volumes
}

output "services" {
  description = "A map of service objects managed by the module."
  value       = module.service.services
}
