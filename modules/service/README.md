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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| services | Map of service configurations | `any` | `{}` | yes |
