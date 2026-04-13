output "networks" {
  description = "A map of network objects managed by this sub-module."
  value       = docker_network.this
}
