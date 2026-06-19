# Docker Service (Swarm) Sub-module

This sub-module manages one or more Docker Swarm services using `for_each`.

## Usage

```hcl
module "services" {
  source = "btougeiro/docker-module//modules/service"

  services = {
    web_service = {
      name = "my-web-service"
      task_spec = [
        {
          container_spec = [
            {
              image = "nginx:latest"
            }
          ]
        }
      ]
      mode = [
        {
          replicated = [{ replicas = 3 }]
        }
      ]
    }
  }
}
```

<!-- BEGIN_TF_DOCS -->
# Docker Service (Swarm) Sub-module

This sub-module manages one or more Docker Swarm services using `for_each`.

## Usage

```hcl
module "services" {
  source = "btougeiro/docker-module//modules/service"

  services = {
    web_service = {
      name = "my-web-service"
      task_spec = [
        {
          container_spec = [
            {
              image = "nginx:latest"
            }
          ]
        }
      ]
      mode = [
        {
          replicated = [{ replicas = 3 }]
        }
      ]
    }
  }
}
```

<!-- BEGIN\_TF\_DOCS -->
<!-- END\_TF\_DOCS -->

## Resources

| Name | Type |
|------|------|
| [docker_service.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_services"></a> [services](#input\_services) | Map of service configurations | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_services"></a> [services](#output\_services) | A map of service objects managed by this sub-module. |
<!-- END_TF_DOCS -->
