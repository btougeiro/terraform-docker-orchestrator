# Docker Config Sub-module

This sub-module manages Docker configs using `for_each`.

<!-- BEGIN_TF_DOCS -->
# Docker Config Sub-module

This sub-module manages Docker configs using `for_each`.

<!-- BEGIN\_TF\_DOCS -->
<!-- END\_TF\_DOCS -->

## Resources

| Name | Type |
|------|------|
| [docker_config.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_configs"></a> [configs](#input\_configs) | Map of config configurations | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_configs"></a> [configs](#output\_configs) | A map of all Docker config resources managed by this module. |
<!-- END_TF_DOCS -->
