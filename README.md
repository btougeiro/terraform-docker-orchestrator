# Terraform Docker Orchestrator Module

Terraform module which creates and manages Docker resources using the [kreuzwerker/docker](https://registry.terraform.io/providers/kreuzwerker/docker/latest) provider.

## Usage

All resource types share the same module call. Only declare the variables you need — everything defaults to an empty map, so unused resource types cost nothing.

### Network

```hcl
module "docker" {
  source  = "btougeiro/orchestrator/docker"
  version = "~> 1.0"

  networks = {
    app = {
      name   = "app-network"
      driver = "bridge"
    }
  }
}
```

### Volume

```hcl
module "docker" {
  source  = "btougeiro/orchestrator/docker"
  version = "~> 1.0"

  volumes = {
    data = {
      name = "app-data"
    }

    nfs = {
      name   = "nfs-share"
      driver = "local"
      driver_opts = {
        type   = "nfs"
        o      = "addr=192.168.1.100,rw"
        device = ":/exports/data"
      }
    }
  }
}
```

### Image

```hcl
module "docker" {
  source  = "btougeiro/orchestrator/docker"
  version = "~> 1.0"

  images = {
    nginx = {
      name         = "nginx:latest"
      keep_locally = true
    }

    app = {
      name         = "myrepo/app:1.0.0"
      keep_locally = true
      pull_triggers = [sha256(file("Dockerfile"))]
    }
  }
}
```

### Container

```hcl
module "docker" {
  source  = "btougeiro/orchestrator/docker"
  version = "~> 1.0"

  containers = {
    web = {
      name    = "nginx"
      image   = "nginx:latest"
      restart = "unless-stopped"

      ports = [{
        internal = 80
        external = 8080
      }]

      healthcheck = [{
        test         = ["CMD", "curl", "-f", "http://localhost/"]
        interval     = "30s"
        timeout      = "5s"
        retries      = 3
        start_period = "10s"
      }]
    }
  }
}
```

### Registry Image

```hcl
module "docker" {
  source  = "btougeiro/orchestrator/docker"
  version = "~> 1.0"

  registry_images = {
    app = {
      name          = "registry.example.com/myapp:1.0.0"
      keep_remotely = true

      build = [{
        context    = "."
        dockerfile = "Dockerfile"

        auth_config = [{
          host_name = "registry.example.com"
          user_name = var.registry_username
          password  = var.registry_password
        }]
      }]
    }
  }
}
```

### Tag

```hcl
module "docker" {
  source  = "btougeiro/orchestrator/docker"
  version = "~> 1.0"

  tags = {
    latest = {
      source_image = "myapp:1.0.0"
      target_image = "myapp:latest"
    }

    staging = {
      source_image = "registry.example.com/myapp:1.0.0"
      target_image = "registry.example.com/myapp:staging"
    }
  }
}
```

### Buildx Builder

```hcl
module "docker" {
  source  = "btougeiro/orchestrator/docker"
  version = "~> 1.0"

  buildx_builders = {
    multiarch = {
      name      = "multiarch-builder"
      driver    = "docker-container"
      use       = true
      bootstrap = true
    }
  }
}
```

### Plugin

```hcl
module "docker" {
  source  = "btougeiro/orchestrator/docker"
  version = "~> 1.0"

  plugins = {
    sshfs = {
      name                  = "vieux/sshfs:latest"
      alias                 = "sshfs"
      grant_all_permissions = true
    }
  }
}
```

### Config (Docker Swarm)

> [!NOTE]
> Docker configs require Swarm mode. Run `docker swarm init` on the target daemon before applying.

```hcl
module "docker" {
  source  = "btougeiro/orchestrator/docker"
  version = "~> 1.0"

  configs = {
    nginx = {
      name = "nginx-config"
      data = base64encode(file("nginx.conf"))
    }

    app = {
      name = "app-config"
      data = base64encode(templatefile("config.json.tpl", {
        db_host   = var.db_host
        log_level = var.log_level
      }))
    }
  }
}
```

### Secret (Docker Swarm)

> [!NOTE]
> Docker secrets require Swarm mode. Run `docker swarm init` on the target daemon before applying.

> [!WARNING]
> Secret values are stored in Terraform state. Use remote state with encryption (S3 + KMS, Terraform Cloud, etc.) and never commit state to version control.

```hcl
module "docker" {
  source  = "btougeiro/orchestrator/docker"
  version = "~> 1.0"

  secrets = {
    db_password = {
      name = "db-password"
      data = base64encode(var.db_password)
    }

    tls_cert = {
      name = "tls-cert"
      data = base64encode(file("server.crt"))
    }
  }
}
```

### Service (Docker Swarm)

> [!NOTE]
> Docker services require Swarm mode. Run `docker swarm init` on the target daemon before applying.

```hcl
module "docker" {
  source  = "btougeiro/orchestrator/docker"
  version = "~> 1.0"

  services = {
    api = {
      name = "api-service"

      task_spec = [{
        container_spec = [{
          image = "myrepo/api:1.0.0"
          env = {
            DATABASE_URL = "postgres://db:5432/myapp"
          }
        }]
      }]

      mode = [{
        replicated = [{ replicas = 3 }]
      }]

      update_config = [{
        parallelism    = 1
        delay          = "10s"
        failure_action = "rollback"
        order          = "start-first"
      }]
    }
  }
}
```

### Full stack

A complete web application stack — network, volume, image pull, and two containers wired together.

```hcl
module "docker" {
  source  = "btougeiro/orchestrator/docker"
  version = "~> 1.0"

  networks = {
    backend = {
      name     = "backend-network"
      driver   = "bridge"
      internal = true
    }
  }

  volumes = {
    pgdata = {
      name = "postgres-data"
    }
  }

  images = {
    postgres = {
      name         = "postgres:16"
      keep_locally = true
    }
    nginx = {
      name         = "nginx:latest"
      keep_locally = true
    }
  }

  containers = {
    db = {
      name    = "postgres"
      image   = "postgres:16"
      restart = "unless-stopped"

      env = [
        "POSTGRES_DB=myapp",
        "POSTGRES_USER=app",
        "POSTGRES_PASSWORD=secret",
      ]

      volumes = [{
        volume_name    = "postgres-data"
        container_path = "/var/lib/postgresql/data"
      }]

      networks_advanced = [{ name = "backend-network" }]
    }

    web = {
      name    = "nginx"
      image   = "nginx:latest"
      restart = "unless-stopped"

      ports = [{
        internal = 80
        external = 8080
      }]

      networks_advanced = [{ name = "backend-network" }]

      healthcheck = [{
        test     = ["CMD", "curl", "-f", "http://localhost/"]
        interval = "30s"
        retries  = 3
      }]
    }
  }
}
```

## Examples

- [docker-container](./examples/docker-container) - Standalone container configuration
- [docker-network](./examples/docker-network) - Network with custom subnet
- [docker-volume](./examples/docker-volume) - Local and NFS volumes
- [docker-config](./examples/docker-config) - Swarm config from file
- [stack](./examples/stack) - Full multi-container stack

## Authors

Module is maintained by [Bruno Tougeiro](https://github.com/btougeiro) with help from [these awesome contributors](https://github.com/btougeiro/terraform-docker-orchestrator/graphs/contributors).

## License

Apache-2.0 Licensed. See [LICENSE](./LICENSE).

<!-- BEGIN_TF_DOCS -->
## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_buildx_builders"></a> [buildx\_builders](#input\_buildx\_builders) | Map of buildx builder configurations | `any` | `{}` | no |
| <a name="input_configs"></a> [configs](#input\_configs) | Map of config configurations | `any` | `{}` | no |
| <a name="input_containers"></a> [containers](#input\_containers) | Map of container configurations | <pre>map(object({<br/>    name                  = string<br/>    image                 = string<br/>    attach                = optional(bool, false)<br/>    command               = optional(list(string))<br/>    cpu_set               = optional(string)<br/>    cpu_shares            = optional(number)<br/>    destroy_grace_seconds = optional(number)<br/>    dns                   = optional(list(string))<br/>    dns_opts              = optional(list(string))<br/>    dns_search            = optional(list(string))<br/>    domainname            = optional(string)<br/>    entrypoint            = optional(list(string))<br/>    env                   = optional(list(string), [])<br/>    group_add             = optional(list(string))<br/>    hostname              = optional(string)<br/>    init                  = optional(bool)<br/>    ipc_mode              = optional(string)<br/>    log_driver            = optional(string, "json-file")<br/>    log_opts              = optional(map(string))<br/>    logs                  = optional(bool, false)<br/>    max_retry_count       = optional(number)<br/>    memory                = optional(number)<br/>    memory_swap           = optional(number)<br/>    must_run              = optional(bool, true)<br/>    network_mode          = optional(string, "bridge")<br/>    pid_mode              = optional(string)<br/>    platform              = optional(string)<br/>    privileged            = optional(bool, false)<br/>    publish_all_ports     = optional(bool, false)<br/>    read_only             = optional(bool, false)<br/>    remove_volumes        = optional(bool, true)<br/>    restart               = optional(string, "no")<br/>    rm                    = optional(bool, false)<br/>    security_opts         = optional(list(string), [])<br/>    shm_size              = optional(number)<br/>    start                 = optional(bool, true)<br/>    stdin_open            = optional(bool, false)<br/>    storage_opts          = optional(map(string))<br/>    sysctls               = optional(map(string))<br/>    tmpfs                 = optional(map(string))<br/>    tty                   = optional(bool, false)<br/>    user                  = optional(string)<br/>    userns_mode           = optional(string)<br/>    working_dir           = optional(string)<br/>    capabilities = optional(list(object({<br/>      add  = optional(list(string))<br/>      drop = optional(list(string))<br/>    })), [])<br/>    devices = optional(list(object({<br/>      host_path      = string<br/>      container_path = optional(string)<br/>      permissions    = optional(string)<br/>    })), [])<br/>    healthcheck = optional(list(object({<br/>      test         = list(string)<br/>      interval     = optional(string)<br/>      retries      = optional(number)<br/>      start_period = optional(string)<br/>      timeout      = optional(string)<br/>    })), [])<br/>    host = optional(list(object({<br/>      host = string<br/>      ip   = string<br/>    })), [])<br/>    labels = optional(list(object({<br/>      label = string<br/>      value = string<br/>    })), [])<br/>    mounts = optional(list(object({<br/>      target    = string<br/>      type      = optional(string, "bind")<br/>      read_only = optional(bool)<br/>      source    = optional(string)<br/>      bind_options = optional(list(object({<br/>        propagation = optional(string)<br/>      })), [])<br/>      tmpfs_options = optional(list(object({<br/>        mode       = optional(number)<br/>        size_bytes = optional(number)<br/>      })), [])<br/>      volume_options = optional(list(object({<br/>        driver_name    = optional(string)<br/>        driver_options = optional(map(string))<br/>        labels = optional(list(object({<br/>          label = string<br/>          value = string<br/>        })), [])<br/>      })), [])<br/>    })), [])<br/>    networks_advanced = optional(list(object({<br/>      name         = string<br/>      aliases      = optional(list(string))<br/>      ipv4_address = optional(string)<br/>      ipv6_address = optional(string)<br/>    })), [])<br/>    ports = optional(list(object({<br/>      internal = number<br/>      external = optional(number)<br/>      ip       = optional(string, "0.0.0.0")<br/>      protocol = optional(string, "tcp")<br/>    })), [])<br/>    ulimit = optional(list(object({<br/>      name = string<br/>      hard = number<br/>      soft = number<br/>    })), [])<br/>    upload = optional(list(object({<br/>      file           = string<br/>      content        = optional(string)<br/>      content_base64 = optional(string)<br/>      executable     = optional(bool)<br/>      source         = optional(string)<br/>      source_hash    = optional(string)<br/>    })), [])<br/>    volumes = optional(list(object({<br/>      container_path = optional(string)<br/>      from_container = optional(string)<br/>      host_path      = optional(string)<br/>      read_only      = optional(bool)<br/>      volume_name    = optional(string)<br/>    })), [])<br/>  }))</pre> | `{}` | no |
| <a name="input_images"></a> [images](#input\_images) | Map of image configurations | `any` | `{}` | no |
| <a name="input_networks"></a> [networks](#input\_networks) | Map of network configurations. Key is the logical name, value is the configuration object. | <pre>map(object({<br/>    name        = string<br/>    create      = optional(bool, true)<br/>    attachable  = optional(bool)<br/>    driver      = optional(string, "bridge")<br/>    ingress     = optional(bool)<br/>    internal    = optional(bool)<br/>    ipam_driver = optional(string, "default")<br/>    ipv6        = optional(bool)<br/>    options     = optional(map(string))<br/>    ipam_config = optional(list(object({<br/>      aux_address = optional(map(string))<br/>      gateway     = optional(string)<br/>      ip_range    = optional(string)<br/>      subnet      = optional(string)<br/>    })), [])<br/>    labels = optional(list(object({<br/>      label = string<br/>      value = string<br/>    })), [])<br/>  }))</pre> | `{}` | no |
| <a name="input_plugins"></a> [plugins](#input\_plugins) | Map of plugin configurations | `any` | `{}` | no |
| <a name="input_registry_images"></a> [registry\_images](#input\_registry\_images) | Map of registry image configurations | `any` | `{}` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | Map of secret configurations | `any` | `{}` | no |
| <a name="input_services"></a> [services](#input\_services) | Map of service configurations | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tag configurations | `any` | `{}` | no |
| <a name="input_volumes"></a> [volumes](#input\_volumes) | Map of volume configurations. Key is the logical name, value is the configuration object. | <pre>map(object({<br/>    name        = string<br/>    create      = optional(bool, true)<br/>    driver      = optional(string, "local")<br/>    driver_opts = optional(map(string))<br/>    labels = optional(list(object({<br/>      label = string<br/>      value = string<br/>    })), [])<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_buildx_builders"></a> [buildx\_builders](#output\_buildx\_builders) | A map of all buildx builder resources managed by this module. |
| <a name="output_configs"></a> [configs](#output\_configs) | A map of all Docker config resources managed by this module. |
| <a name="output_containers"></a> [containers](#output\_containers) | A map of all container resources managed by this module. |
| <a name="output_images"></a> [images](#output\_images) | A map of all Docker image resources managed by this module. |
| <a name="output_networks"></a> [networks](#output\_networks) | A map of all network resources, both created and referenced. |
| <a name="output_plugins"></a> [plugins](#output\_plugins) | A map of all Docker plugin resources managed by this module. |
| <a name="output_registry_images"></a> [registry\_images](#output\_registry\_images) | A map of all Docker registry image resources managed by this module. |
| <a name="output_secrets"></a> [secrets](#output\_secrets) | A map of all Docker secret resources managed by this module. |
| <a name="output_services"></a> [services](#output\_services) | A map of all Swarm service resources managed by this module. |
| <a name="output_tags"></a> [tags](#output\_tags) | A map of all Docker tag resources managed by this module. |
| <a name="output_volumes"></a> [volumes](#output\_volumes) | A map of all volume resources created by this module. |
<!-- END_TF_DOCS -->
