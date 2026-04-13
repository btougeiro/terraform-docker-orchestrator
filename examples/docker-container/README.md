# Docker Container Example

This example demonstrates how to deploy a set of Nginx containers using the container sub-module.

## Usage

```hcl
module "nginx_containers" {
  source = "../../modules/container"

  containers = {
    web1 = {
      name  = "nginx-1"
      image = "nginx:latest"
      ports = [{ internal = 80, external = 8081 }]
    }
    web2 = {
      name  = "nginx-2"
      image = "nginx:latest"
      ports = [{ internal = 80, external = 8082 }]
    }
  }
}
```
