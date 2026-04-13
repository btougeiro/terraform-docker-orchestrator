# -----------------------------------------------------------------------------
# DOCKER ORCHESTRATOR MODULE
# -----------------------------------------------------------------------------

module "network" {
  source   = "./modules/network"
  networks = var.networks
}

module "volume" {
  source  = "./modules/volume"
  volumes = var.volumes
}

module "config" {
  source  = "./modules/config"
  configs = var.configs
}

module "secret" {
  source  = "./modules/secret"
  secrets = var.secrets
}

module "image" {
  source = "./modules/image"
  images = var.images
}

module "registry_image" {
  source          = "./modules/registry_image"
  registry_images = var.registry_images
}

module "plugin" {
  source  = "./modules/plugin"
  plugins = var.plugins
}

module "tag" {
  source = "./modules/tag"
  tags   = var.tags
}

module "buildx_builder" {
  source          = "./modules/buildx_builder"
  buildx_builders = var.buildx_builders
}

module "container" {
  source     = "./modules/container"
  containers = var.containers
  depends_on = [module.network, module.volume, module.config, module.secret, module.image]
}

module "exec" {
  source     = "./modules/exec"
  execs      = var.execs
  depends_on = [module.container]
}

module "service" {
  source   = "./modules/service"
  services = var.services
}
