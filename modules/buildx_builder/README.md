# Docker Buildx Builder Sub-module

This sub-module manages Docker buildx builders using `for_each`.

<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [docker_buildx_builder.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/buildx_builder) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_buildx_builders"></a> [buildx\_builders](#input\_buildx\_builders) | Map of buildx builder configurations | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_buildx_builders"></a> [buildx\_builders](#output\_buildx\_builders) | A map of all buildx builder resources managed by this module. |
<!-- END_TF_DOCS -->
