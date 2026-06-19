# Docker Container Sub-module

This sub-module manages one or more Docker containers using `for_each`.

## Usage

```hcl
module "containers" {
  source = "btougeiro/docker-module//modules/container"

  containers = {
    web = {
      name  = "nginx-server"
      image = "nginx:latest"
      ports = [
        {
          internal = 80
          external = 8080
        }
      ]
    }
  }
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
