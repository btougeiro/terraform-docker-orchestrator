module "networks" {
  source = "../../modules/network"

  networks = {
    frontend = {
      name   = "frontend-net"
      driver = "bridge"
    }
    backend = {
      name     = "backend-net"
      driver   = "bridge"
      internal = true
    }
  }
}
