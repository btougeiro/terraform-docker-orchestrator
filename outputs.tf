# -----------------------------------------------------------------------------
# OUTPUTS
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# DOCKER CONFIG
# -----------------------------------------------------------------------------

output "config_name" {
  value       = var.create_docker_config ? docker_config.this[0].name : null
  description = "User-defined name of the config."
}

output "config_id" {
  value       = var.create_docker_config ? docker_config.this[0].id : null
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER CONTAINER
# -----------------------------------------------------------------------------

output "container_name" {
  value       = var.create_docker_container ? docker_container.this[0].name : null
  description = "The name of the container."
}

output "container_id" {
  value       = var.create_docker_container ? docker_container.this[0].id : null
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER IMAGE
# -----------------------------------------------------------------------------

output "image_name" {
  value       = var.image_pull ? docker_image.this[0].name : null
  description = "The name of the Docker image, including any tags or SHA256 repo digests."
}

output "image_id" {
  value       = var.image_pull ? docker_image.this[0].id : null
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER NETWORK
# -----------------------------------------------------------------------------

output "network_name" {
  value       = var.create_docker_network ? docker_network.this[0].name : null
  description = "The name of the Docker network."
}

output "network_id" {
  value       = var.create_docker_network ? docker_network.this[0].id : null
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER PLUGIN
# -----------------------------------------------------------------------------

output "plugin_name" {
  value       = var.create_docker_plugin ? docker_plugin.this[0].name : null
  description = "Docker Plugin name."
}

output "plugin_id" {
  value       = var.create_docker_plugin ? docker_plugin.this[0].id : null
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER REGISTRY IMAGE
# -----------------------------------------------------------------------------

output "registry_image_name" {
  value       = var.create_registry_image ? docker_registry_image.this[0].name : null
  description = "The name of the Docker image."
}

output "registry_image_id" {
  value       = var.create_registry_image ? docker_registry_image.this[0].id : null
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER SECRET
# -----------------------------------------------------------------------------

output "secret_name" {
  value       = var.create_docker_secret ? docker_secret.this[0].name : null
  description = "User-defined name of the secret."
}

output "secret_id" {
  value       = var.create_docker_secret ? docker_secret.this[0].id : null
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER SERVICE
# -----------------------------------------------------------------------------

output "service_name" {
  value       = var.create_docker_service ? docker_service.this[0].name : null
  description = "Name of the service."
}

output "service_id" {
  value       = var.create_docker_service ? docker_service.this[0].id : null
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER VOLUME
# -----------------------------------------------------------------------------

output "volume_name" {
  value       = var.create_docker_volume ? docker_volume.this[0].name : null
  description = "The name of the Docker volume (will be generated if not provided)."
}

output "volume_id" {
  value       = var.create_docker_volume ? docker_volume.this[0].id : null
  description = "The ID of this resource."
}
