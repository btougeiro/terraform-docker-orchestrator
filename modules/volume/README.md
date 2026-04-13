# Docker Volume Sub-module

This sub-module manages one or more Docker volumes using `for_each`.

## Usage

```hcl
module "volumes" {
  source = "btougeiro/docker-module//modules/volume"

  volumes = {
    data_volume = {
      name   = "app-data"
      driver = "local"
      labels = [
        {
          label = "environment"
          value = "production"
        }
      ]
    }
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| volumes | Map of volume configurations | `any` | `{}` | yes |
