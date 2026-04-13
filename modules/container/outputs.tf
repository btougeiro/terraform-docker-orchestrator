output "containers" {
  description = "A map of container objects managed by this sub-module."
  value       = docker_container.this
}
