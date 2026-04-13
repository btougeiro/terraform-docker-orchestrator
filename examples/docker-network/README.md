# Docker Network Example

This example demonstrates how to deploy multiple Docker networks using the network sub-module.

## Usage

```hcl
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
```
