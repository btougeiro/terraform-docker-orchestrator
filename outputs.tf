# -----------------------------------------------------------------------------
# OUTPUTS
# -----------------------------------------------------------------------------

output "containers" {
  description = "A map of container objects managed by the module."
  value       = module.container.containers
}

output "networks" {
  description = "A map of network objects managed by the module."
  value       = module.network.networks
}

output "volumes" {
  description = "A map of volume objects managed by the module."
  value       = module.volume.volumes
}

output "configs" {
  description = "A map of config objects managed by the module."
  value       = module.config.configs
}

output "secrets" {
  description = "A map of secret objects managed by the module."
  value       = module.secret.secrets
}

output "images" {
  description = "A map of image objects managed by the module."
  value       = module.image.images
}

output "registry_images" {
  description = "A map of registry image objects managed by the module."
  value       = module.registry_image.registry_images
}

output "plugins" {
  description = "A map of plugin objects managed by the module."
  value       = module.plugin.plugins
}

output "tags" {
  description = "A map of tag objects managed by the module."
  value       = module.tag.tags
}

output "buildx_builders" {
  description = "A map of buildx builder objects managed by the module."
  value       = module.buildx_builder.buildx_builders
}

output "execs" {
  description = "A map of exec objects managed by the module."
  value       = module.exec.execs
}

output "services" {
  description = "A map of service objects managed by the module."
  value       = module.service.services
}
