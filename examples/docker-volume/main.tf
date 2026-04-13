module "volume" {
  source = "../../modules/volume"

  volumes = {
    data_volume = {
      name   = "my-data-volume"
      driver = "local"
    }
  }
}
