# Docker Volume Example

This example demonstrates how to deploy multiple Docker volumes using the volume sub-module.

## Usage

```hcl
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
```
