output "networks" {
  description = "A map of all network resources, both created and referenced."
  value       = module.network.networks
}

output "volumes" {
  description = "A map of all volume resources created by this module."
  value       = module.volume.volumes
}

output "configs" {
  description = "A map of all Docker config resources managed by this module."
  value       = module.config.configs
}

output "secrets" {
  description = "A map of all Docker secret resources managed by this module."
  value       = module.secret.secrets
}

output "images" {
  description = "A map of all Docker image resources managed by this module."
  value       = module.image.images
}

output "registry_images" {
  description = "A map of all Docker registry image resources managed by this module."
  value       = module.registry_image.registry_images
}

output "plugins" {
  description = "A map of all Docker plugin resources managed by this module."
  value       = module.plugin.plugins
}

output "tags" {
  description = "A map of all Docker tag resources managed by this module."
  value       = module.tag.tags
}

output "buildx_builders" {
  description = "A map of all buildx builder resources managed by this module."
  value       = module.buildx_builder.buildx_builders
}

output "containers" {
  description = "A map of all container resources managed by this module."
  value       = module.container.containers
}

output "services" {
  description = "A map of all Swarm service resources managed by this module."
  value       = module.service.services
}
