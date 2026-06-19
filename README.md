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

