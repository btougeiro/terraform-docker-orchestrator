# -----------------------------------------------------------------------------
# OUTPUTS
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# DOCKER CONFIG
# -----------------------------------------------------------------------------

output "config_name" {
  value = module.docker_config.config_name
}

output "config_id" {
  value = module.docker_config.config_id
}

output "config_name_with_service" {
  value = module.docker_config_with_service.config_name
}

output "config_name_with_service_id" {
  value = module.docker_config_with_service.config_id
}

output "service_name" {
  value = module.docker_config_with_service.service_name
}

output "service_id" {
  value = module.docker_config_with_service.service_id
}
