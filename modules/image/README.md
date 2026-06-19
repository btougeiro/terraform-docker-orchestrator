# Docker Image Sub-module

This sub-module manages Docker images using `for_each`.

<!-- BEGIN_TF_DOCS -->
# Docker Image Sub-module

This sub-module manages Docker images using `for_each`.

<!-- BEGIN\_TF\_DOCS -->
<!-- END\_TF\_DOCS -->

## Resources

| Name | Type |
|------|------|
| [docker_image.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_images"></a> [images](#input\_images) | Map of image configurations | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_images"></a> [images](#output\_images) | A map of all Docker image resources managed by this module. |
<!-- END_TF_DOCS -->
