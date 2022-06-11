# -----------------------------------------------------------------------------
# OUTPUTS
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# DOCKER CONFIG
# -----------------------------------------------------------------------------

output "config_name" {
  value = docker_config.this.name
  description = "User-defined name of the config."
}

output "config_id" {
  value = docker_config.this.id
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER CONTAINER
# -----------------------------------------------------------------------------

output "container_name" {
  value = docker_container.this.name
  description = "The name of the container."
}

output "container_id" {
  value = docker_container.this.id
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER IMAGE
# -----------------------------------------------------------------------------

output "image_name" {
  value = docker_image.this.name
  description = "The name of the Docker image, including any tags or SHA256 repo digests."
}

output "image_id" {
  value = docker_image.this.id
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER NETWORK
# -----------------------------------------------------------------------------

output "network_name" {
  value = docker_network.this.name
  description = "The name of the Docker network."
}

output "network_id" {
  value = docker_network.this.id
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER PLUGIN
# -----------------------------------------------------------------------------

output "plugin_name" {
  value = docker_plugin.this.name
  description = "Docker Plugin name."
}

output "plugin_id" {
  value = docker_plugin.this.id
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER REGISTRY IMAGE
# -----------------------------------------------------------------------------

output "registry_image_name" {
  value = docker_registry_image.this.name
  description = "The name of the Docker image."
}

output "registry_image_id" {
  value = docker_registry_image.this.id
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER SECRET
# -----------------------------------------------------------------------------

output "secret_name" {
  value = docker_secret.this.name
  description = "User-defined name of the secret."

}

output "secret_id" {
  value = docker_secret.this.id
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER SERVICE
# -----------------------------------------------------------------------------

 output "service_name" {
   value = docker_service.this.name
   description = "Name of the service."
 }

output "service_id" {
  value = docker_service.this.id
  description = "The ID of this resource."
}

# -----------------------------------------------------------------------------
# DOCKER VOLUME
# -----------------------------------------------------------------------------

output "volume_name" {
  value = docker_volume.this.name
  description = "The name of the Docker volume (will be generated if not provided)."
}

output "volume_id" {
  value = docker_volume.this.id
  description = "The ID of this resource."
}
