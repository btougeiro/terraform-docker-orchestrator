module "volumes" {
  source = "../../modules/volume"

  volumes = {
    web_data = {
      name = "web-data-volume"
    }
    db_data = {
      name = "db-data-volume"
    }
  }
}
