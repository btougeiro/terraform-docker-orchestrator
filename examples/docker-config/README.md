# Docker Config Example

This example demonstrates how to create a Docker config using the config sub-module.

## Usage

```hcl
module "config" {
  source = "../../modules/config"

  configs = {
    my_config = {
      name = "app-config"
      data = base64encode("key=value")
    }
  }
}
```
