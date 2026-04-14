# -----------------------------------------------------------------------------
# DOCKER VOLUME SUB-MODULE OUTPUTS
# -----------------------------------------------------------------------------

output "volumes" {
  description = "A map containing all volume resources created by this module."
  value       = docker_volume.this
}
