# Docker Secret Sub-module

This sub-module manages Docker secrets using `for_each`.

<!-- BEGIN_TF_DOCS -->
# Docker Secret Sub-module

This sub-module manages Docker secrets using `for_each`.

## Resources

| Name | Type |
|------|------|
| [docker_secret.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_secrets"></a> [secrets](#input\_secrets) | Map of secret configurations | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secrets"></a> [secrets](#output\_secrets) | n/a |
<!-- END_TF_DOCS -->