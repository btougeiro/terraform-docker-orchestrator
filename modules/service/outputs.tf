output "services" {
  description = "A map of service objects managed by this sub-module."
  value       = docker_service.this
}
