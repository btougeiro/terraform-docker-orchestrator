module "network" {
  source = "../../modules/network"

  networks = {
    app_net = {
      name   = "my-app-network"
      driver = "bridge"
    }
  }
}
