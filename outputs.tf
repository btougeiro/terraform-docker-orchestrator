# -----------------------------------------------------------------------------
# DOCKER ORCHESTRATOR MODULE OUTPUTS
# -----------------------------------------------------------------------------

output "networks" {
  description = "A map containing all network resources."
  value       = module.network.networks
}

output "volumes" {
  description = "A map containing all volume resources."
  value       = module.volume.volumes
}

output "containers" {
  description = "A map containing all container resources."
  value       = module.container.containers
}

# (Add other outputs as needed)
