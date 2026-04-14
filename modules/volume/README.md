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

<!-- BEGIN_TF_DOCS -->
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

## Resources

| Name | Type |
|------|------|
| [docker_volume.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_volumes"></a> [volumes](#input\_volumes) | Map of volume configurations. Key is the logical name, value is the configuration object. | <pre>map(object({<br>    name        = string<br>    create      = optional(bool, true)<br>    driver      = optional(string, "local")<br>    driver_opts = optional(map(string))<br>    labels = optional(list(object({<br>      label = string<br>      value = string<br>    })), [])<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_volumes"></a> [volumes](#output\_volumes) | A map containing all volume resources created by this module. |
<!-- END_TF_DOCS -->