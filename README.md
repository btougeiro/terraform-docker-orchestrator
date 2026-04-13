# Terraform Docker Orchestrator Module

This module provides a unified, modular approach to managing Docker resources (Containers, Networks, Volumes, and Swarm Services).

## Features

- **Modular Architecture:** Call only the components you need (`modules/container`, `modules/network`, etc.).
- **Bulk Operations:** Uses `for_each` to manage multiple resources in a single call.
- **Provider Ready:** Optimized for the `kreuzwerker/docker` provider.

## Usage

```hcl
module "docker_stack" {
  source = "btougeiro/docker-module"

  networks = {
    app_net = { name = "app-network" }
  }

  volumes = {
    db_data = { name = "database-volume" }
  }

  containers = {
    web = {
      name  = "frontend"
      image = "nginx:latest"
      networks_advanced = [{ name = "app-network" }]
      ports = [{ internal = 80, external = 8080 }]
    }
  }
}
```

## Sub-modules

- [Container](./modules/container)
- [Network](./modules/network)
- [Volume](./modules/volume)
- [Config](./modules/config)
- [Secret](./modules/secret)
- [Image](./modules/image)
- [Registry Image](./modules/registry_image)
- [Plugin](./modules/plugin)
- [Service (Swarm)](./modules/service)
