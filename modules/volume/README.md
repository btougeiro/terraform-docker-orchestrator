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

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
