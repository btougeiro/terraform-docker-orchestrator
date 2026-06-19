# -----------------------------------------------------------------------------
# DOCKER NETWORK SUB-MODULE OUTPUTS
# -----------------------------------------------------------------------------

output "networks" {
  description = "A map containing all network resources, both created and referenced."
  value       = merge(docker_network.this, data.docker_network.this)
}
