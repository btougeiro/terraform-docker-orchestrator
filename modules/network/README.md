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

<!-- BEGIN_TF_DOCS -->
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

<!-- BEGIN\_TF\_DOCS -->
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

<!-- BEGIN\\_TF\\_DOCS -->
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

<!-- BEGIN\\\_TF\\\_DOCS -->
<!-- END\\\_TF\\\_DOCS -->

## Resources

| Name | Type |
|------|------|
| [docker\\_network.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input\\_networks"></a> [networks](#input\\\_networks) | Map of network configurations. Key is the logical name, value is the configuration object. | <pre>map(object({<br/>    name        = string<br/>    create      = optional(bool, true)<br/>    attachable  = optional(bool)<br/>    driver      = optional(string, "bridge")<br/>    ingress     = optional(bool)<br/>    internal    = optional(bool)<br/>    ipam\\_driver = optional(string, "default")<br/>    ipv6        = optional(bool)<br/>    options     = optional(map(string))<br/>    ipam\\_config = optional(list(object({<br/>      aux\\_address = optional(map(string))<br/>      gateway     = optional(string)<br/>      ip\\_range    = optional(string)<br/>      subnet      = optional(string)<br/>    })), [])<br/>    labels = optional(list(object({<br/>      label = string<br/>      value = string<br/>    })), [])<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output\\_networks"></a> [networks](#output\\\_networks) | A map containing all network resources, both created and referenced. |
<!-- END\\_TF\\_DOCS -->

## Resources

| Name | Type |
|------|------|
| [docker\_network.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input\_networks"></a> [networks](#input\\_networks) | Map of network configurations. Key is the logical name, value is the configuration object. | <pre>map(object({<br/>    name        = string<br/>    create      = optional(bool, true)<br/>    attachable  = optional(bool)<br/>    driver      = optional(string, "bridge")<br/>    ingress     = optional(bool)<br/>    internal    = optional(bool)<br/>    ipam\_driver = optional(string, "default")<br/>    ipv6        = optional(bool)<br/>    options     = optional(map(string))<br/>    ipam\_config = optional(list(object({<br/>      aux\_address = optional(map(string))<br/>      gateway     = optional(string)<br/>      ip\_range    = optional(string)<br/>      subnet      = optional(string)<br/>    })), [])<br/>    labels = optional(list(object({<br/>      label = string<br/>      value = string<br/>    })), [])<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output\_networks"></a> [networks](#output\\_networks) | A map containing all network resources, both created and referenced. |
<!-- END\_TF\_DOCS -->

## Resources

| Name | Type |
|------|------|
| [docker_network.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_networks"></a> [networks](#input\_networks) | Map of network configurations. Key is the logical name, value is the configuration object. | <pre>map(object({<br/>    name        = string<br/>    create      = optional(bool, true)<br/>    attachable  = optional(bool)<br/>    driver      = optional(string, "bridge")<br/>    ingress     = optional(bool)<br/>    internal    = optional(bool)<br/>    ipam_driver = optional(string, "default")<br/>    ipv6        = optional(bool)<br/>    options     = optional(map(string))<br/>    ipam_config = optional(list(object({<br/>      aux_address = optional(map(string))<br/>      gateway     = optional(string)<br/>      ip_range    = optional(string)<br/>      subnet      = optional(string)<br/>    })), [])<br/>    labels = optional(list(object({<br/>      label = string<br/>      value = string<br/>    })), [])<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_networks"></a> [networks](#output\_networks) | A map containing all network resources, both created and referenced. |
<!-- END_TF_DOCS -->
