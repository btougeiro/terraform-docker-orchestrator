module "docker_stack" {
  source = "../../"

  networks = {
    app_net = {
      name = "my-app-network"
    }
  }

  volumes = {
    db_data = {
      name = "my-db-volume"
    }
  }

  containers = {
    web = {
      name  = "nginx-frontend"
      image = "nginx:latest"
      networks_advanced = [{ name = "my-app-network" }]
      ports = [{ internal = 80, external = 8080 }]
      mounts = [
        {
          target = "/usr/share/nginx/html"
          source = "my-db-volume"
          type   = "volume"
        }
      ]
    }
  }
}
