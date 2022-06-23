# -----------------------------------------------------------------------------
# MAIN
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# PROVIDER
# -----------------------------------------------------------------------------

# Docker Desktop on Windows
provider "docker" {
  host = "npipe:////./pipe/dockerDesktopLinuxEngine"
}

# Docker on Unix
#provider "docker" {
#  host = "unix:///var/run/docker.sock"
#}

# -----------------------------------------------------------------------------
# DOCKER CONFIG EXAMPLE 1
# -----------------------------------------------------------------------------

module "docker_config" {
  source = "../../"

  create_docker_config = true
  config_name          = "foo_config"
  config_data          = base64encode("{\"key\": \"value\"}")
}

# -----------------------------------------------------------------------------
# DOCKER CONFIG EXAMPLE 2
# -----------------------------------------------------------------------------

module "docker_config_with_service" {
  source = "../../"

  create_docker_config = true
  config_name          = "foo_config_with_service"
  config_data          = base64encode("{\"key\": \"value\"}")

  image_pull         = true
  image_name         = "nginx:latest"
  image_force_remove = true

  create_docker_service = true
  service_name          = "service-with-config"
  service_mode = [
    {
      global = true
    }
  ]
  service_task_spec = [
    {
      container_spec = [
        {
          image = module.docker_config_with_service.image_name

          labels = [
            {
              label = "foo.bar"
              value = "baz"
            }
          ]

          configs = [
            {
              config_name = module.docker_config_with_service.config_name
              config_id   = module.docker_config_with_service.config_id
              file_name   = "/config.json"
            }
          ]
        }
      ]
    }
  ]

  service_endpoint_spec = [
    {
      ports = [
        {
          published_port = 8080
          target_port    = 80
        }
      ]
    }
  ]
}
