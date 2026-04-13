output "volumes" {
  description = "A map of volume objects managed by this sub-module."
  value       = docker_volume.this
}
