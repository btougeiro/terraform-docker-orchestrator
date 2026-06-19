# Docker Plugin Sub-module

This sub-module manages Docker plugins using `for_each`.

<!-- BEGIN_TF_DOCS -->
# Docker Plugin Sub-module

This sub-module manages Docker plugins using `for_each`.

<!-- BEGIN\_TF\_DOCS -->
<!-- END\_TF\_DOCS -->

## Resources

| Name | Type |
|------|------|
| [docker_plugin.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/plugin) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_plugins"></a> [plugins](#input\_plugins) | Map of plugin configurations | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_plugins"></a> [plugins](#output\_plugins) | A map of all Docker plugin resources managed by this module. |
<!-- END_TF_DOCS -->
