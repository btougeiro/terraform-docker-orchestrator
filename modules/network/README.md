# Docker Network Sub-module

This sub-module manages one or more Docker networks using `for_each`.

## Usage

```hcl
module "networks" {
  source = "btougeiro/docker-module//modules/network"

  networks = {
    app_network = {
      name   = "my-network"
      driver = "bridge"
      ipam_config = [
        {
          subnet = "10.0.1.0/24"
        }
      ]
    }
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| networks | Map of network configurations | `any` | `{}` | yes |
