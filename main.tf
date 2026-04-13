# -----------------------------------------------------------------------------
# DOCKER ORCHESTRATOR MODULE
# -----------------------------------------------------------------------------

module "network" {
  source = "./modules/network"
  networks = var.networks
}

module "volume" {
  source = "./modules/volume"
  volumes = var.volumes
}

module "container" {
  source = "./modules/container"
  containers = var.containers
  depends_on = [module.network, module.volume]
}

module "service" {
  source = "./modules/service"
  services = var.services
}
