# -----------------------------------------------------------------------------
# DOCKER CONTAINER SUB-MODULE OUTPUTS
# -----------------------------------------------------------------------------

output "containers" {
  description = "A map containing all container resources."
  value       = docker_container.this
}
