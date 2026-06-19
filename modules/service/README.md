# Docker Service (Swarm) Sub-module

This sub-module manages one or more Docker Swarm services using `for_each`.

## Usage

```hcl
module "services" {
  source = "btougeiro/module/docker//modules/service"

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
<!-- END_TF_DOCS -->
