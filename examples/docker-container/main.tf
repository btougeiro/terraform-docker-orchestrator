module "container" {
  source = "../../modules/container"

  containers = {
    web = {
      name  = "nginx-server"
      image = "nginx:latest"
      ports = [
        {
          internal = 80
          external = 8080
        }
      ]
    }
  }
}
