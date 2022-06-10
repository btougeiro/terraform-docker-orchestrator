# Docker Terraform Module

Terraform module which creates Docker resources.

The Docker provider is used to interact with Docker containers and images. It uses the Docker API to manage the lifecycle of Docker containers.  
Because the Docker provider uses the Docker API, it is immediately compatible not only with single server Docker but Swarm and any additional Docker-compatible API hosts.

### External Documentation

Please note that we strive to provide a comprehensive suite of documentation for __*configuring and utilizing the module(s)*__ defined here, and that documentation regarding Docker features, usage, etc. are better left up to their respective sources:
- [Docker Documentation](https://docs.docker.com/get-started/)

## Usage

```hcl
module "docker" {
  source  = "btougeiro/terraform-docker-module"
  version = ">= 1.0.0"
}
```

## Examples

- [Complete](https://github.com/btougeiro/terraform-docker-module/tree/main/examples/complete): Docker configuration using all available resources in various combinations demonstrating many of the supported features and configurations.
- [Docker Config](https://github.com/btougeiro/terraform-docker-module/tree/main/examples/docker-config): Manages the configs of a Docker service in a swarm.
- [Docker Container](https://github.com/btougeiro/terraform-docker-module/tree/main/examples/docker-container): Manages the lifecycle of a Docker container.
- [Docker Image](https://github.com/btougeiro/terraform-docker-module/tree/main/examples/docker-image): Pulls a Docker image to a given Docker host from a Docker Registry. This resource will not pull new layers of the image automatically unless used in conjunction with [docker_registry_image](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/registry_image) data source to update the `pull_triggers` field.
- [Docker Network](https://github.com/btougeiro/terraform-docker-module/tree/main/examples/docker-network): `docker_network` provides details about a specific Docker Network.
- [Docker Plugin](https://github.com/btougeiro/terraform-docker-module/tree/main/examples/docker-plugin): Manages the lifecycle of a Docker plugin.
- [Docker Registry Image](https://github.com/btougeiro/terraform-docker-module/tree/main/examples/docker-registry-image): Manages the lifecycle of docker image/tag in a registry means it can store one or more version of specific docker images and identified by their tags.
- [Docker Secret](https://github.com/btougeiro/terraform-docker-module/tree/main/examples/docker-secret): Manages the secrets of a Docker service in a swarm.
- [Docker Service](https://github.com/btougeiro/terraform-docker-module/tree/main/examples/docker-service): This resource manages the lifecycle of a Docker service. By default, the creation, update and delete of services are detached. With the [Converge Config](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/service#convergeconfig) the behavior of the `docker cli` is imitated to guarantee tha for example, all tasks of a service are running or successfully updated or to inform `terraform` that a service could not be updated and was successfully rolled back.
- [Docker Volume](https://github.com/btougeiro/terraform-docker-module/tree/main/examples/docker-volume): Creates and destroys a volume in Docker. This can be used alongside [docker_container](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container) to prepare volumes that can be shared across containers.

## Requirements

| Name                                                                      | Version     |
|---------------------------------------------------------------------------|-------------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0   |
| <a name="requirement_docker"></a> [docker](#requirement\_docker)          | >= 20.10.16 |

## Providers

| Name                                                                             | Version   |
|----------------------------------------------------------------------------------|-----------|
| [docker](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs) | >= 2.16.0 |

## Resources

| Name                                                                                                                          | Type     |
|-------------------------------------------------------------------------------------------------------------------------------|----------|
| [docker_config.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/config)                 | resource |
| [docker_container.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container)           | resource |
| [docker_image.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image)                   | resource |
| [docker_network.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/network)               | resource |
| [docker_plugin.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/plugin)                 | resource |
| [docker_registry_image.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/registry_image) | resource |
| [docker_secret.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/secret)                 | resource |
| [docker_service.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/service)               | resource |
| [docker_volume.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/volume)                 | resource |

## Inputs

| Name                                                                                                        | Description                                         | Type     | Default | Required |
|-------------------------------------------------------------------------------------------------------------|-----------------------------------------------------|----------|---------|:--------:|
| <a name="input_create_docker_config"></a> [create\_docker\_config](#input\_create\_docker\_config)          | Manages the configs of a Docker service in a swarm. | `bool`   | `false` |   yes    |
| <a name="input_config_name"></a> [create\_config\_name](#input\_config\_name\_)                             | Base64-url-safe-encoded config data.                | `string` | `null`  |   yes    |
| <a name="input_config_data"></a> [create\_config\_data](#input\_config\_data\_)                             | User-defined name of the config.                    | `string` | `null`  |   yes    |
| <a name="input_config_id"></a> [create\_config\_id](#input\_config\_id\_)                                   | The ID of this resource.                            | `string` | `null`  |    no    |
| <a name="input_create_docker_container"></a> [create\_docker\_container](#input\_create\_docker\_container) | Manages the lifecycle of a Docker container.        | `bool`   | `false` |   yes    |

## Outputs

| Name                                                                                            | Description                      |
|-------------------------------------------------------------------------------------------------|----------------------------------|
| <a name="output_docker_config_name"></a> [docker\_config\_name](#output\_docker\_config\_name)  | User-defined name of the config. |

## License

Apache 2 Licensed. See [LICENSE](https://github.com/btougeiro/terraform-docker-module/tree/main/LICENSE) for full details.
