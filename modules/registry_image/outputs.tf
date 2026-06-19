output "registry_images" {
  description = "A map of all Docker registry image resources managed by this module."
  value       = docker_registry_image.this
}
