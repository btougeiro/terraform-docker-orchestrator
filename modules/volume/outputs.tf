# -----------------------------------------------------------------------------
# DOCKER VOLUME SUB-MODULE OUTPUTS
# -----------------------------------------------------------------------------

output "volumes" {
  description = "A map containing all volume resources, both created and referenced."
  value       = merge(docker_volume.this, data.docker_volume.this)
}
