# -----------------------------------------------------------------------------
# OUTPUTS
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# DOCKER CONFIG
# -----------------------------------------------------------------------------

output "docker_config_name" {
  value = docker_config.this.name
  description = "User-defined name of the config."
}

output "docker_config_id" {
  value = docker_config.this.id
}

# -----------------------------------------------------------------------------
# DOCKER CONTAINER
# -----------------------------------------------------------------------------

output "docker_container_name" {
  value = docker_container.this.name
}

output "docker_container_id" {
  value = docker_container.this.id
}

output "docker_container_image" {
  value = docker_container.this.image
}

output "docker_container_ports" {
  value = docker_container.this.ports
}

output "docker_container_labels" {
  value = docker_container.this.labels
}

output "docker_container_mounts" {
  value = docker_container.this.mounts
}

# -----------------------------------------------------------------------------
# DOCKER IMAGE
# -----------------------------------------------------------------------------

output "docker_image_name" {
  value = docker_image.this.name
}

output "docker_image_id" {
  value = docker_image.this.id
}

# -----------------------------------------------------------------------------
# DOCKER NETWORK
# -----------------------------------------------------------------------------

output "docker_network_name" {
  value = docker_network.this.name
}

output "docker_network_id" {
  value = docker_network.this.id
}

output "docker_network_driver" {
  value = docker_network.this.driver
}

# -----------------------------------------------------------------------------
# DOCKER PLUGIN
# -----------------------------------------------------------------------------

output "docker_plugin_name" {
  value = docker_plugin.this.name
}

output "docker_plugin_id" {
  value = docker_plugin.this.id
}

output "docker_plugin_alias" {
  value = docker_plugin.this.alias
}

# -----------------------------------------------------------------------------
# DOCKER REGISTRY IMAGE
# -----------------------------------------------------------------------------

output "docker_registry_image_name" {
  value = docker_registry_image.this.name
}

output "docker_registry_image_id" {
  value = docker_registry_image.this.id
}

# -----------------------------------------------------------------------------
# DOCKER SECRET
# -----------------------------------------------------------------------------

output "docker_secret_name" {
  value = docker_secret.this.name
}

output "docker_secret_id" {
  value = docker_secret.this.id
}

# -----------------------------------------------------------------------------
# DOCKER SERVICE
# -----------------------------------------------------------------------------

 output "docker_service_name" {
   value = docker_service.this.name
 }

output "docker_service_id" {
  value = docker_service.this.id
}

output "docker_service_task_spec" {
  value = docker_service.this.task_spec
}

# -----------------------------------------------------------------------------
# DOCKER VOLUME
# -----------------------------------------------------------------------------

output "docker_volume_name" {
  value = docker_volume.this.name
}

output "docker_volume_id" {
  value = docker_volume.this.id
}

output "docker_volume_mountpoint" {
  value = docker_volume.this.mountpoint
}
