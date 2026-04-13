terraform {
  required_version = ">= 1.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4.1.0"
    }
  }
}
