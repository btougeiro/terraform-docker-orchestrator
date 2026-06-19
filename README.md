# Terraform Docker Orchestrator Module

This module provides a unified, modular approach to managing Docker resources (Containers, Networks, Volumes, and Swarm Services).

## Features

- **Modular Architecture:** Call only the components you need (`modules/container`, `modules/network`, etc.).
- **Bulk Operations:** Uses `for_each` to manage multiple resources in a single call.
- **Provider Ready:** Optimized for the `kreuzwerker/docker` provider.

## Usage

```hcl
module "docker_stack" {
  source = "btougeiro/docker-module"

  networks = {
    app_net = { name = "app-network" }
  }

  volumes = {
    db_data = { name = "database-volume" }
  }

  containers = {
    web = {
      name  = "frontend"
      image = "nginx:latest"
      networks_advanced = [{ name = "app-network" }]
      ports = [{ internal = 80, external = 8080 }]
    }
  }
}
```

## Sub-modules

- [Container](./modules/container)
- [Network](./modules/network)
- [Volume](./modules/volume)
- [Config](./modules/config)
- [Secret](./modules/secret)
- [Image](./modules/image)
- [Registry Image](./modules/registry_image)
- [Plugin](./modules/plugin)
- [Tag](./modules/tag)
- [Buildx Builder](./modules/buildx_builder)
- [Service (Swarm)](./modules/service)

<!-- BEGIN_TF_DOCS -->
# Terraform Docker Orchestrator Module

This module provides a unified, modular approach to managing Docker resources (Containers, Networks, Volumes, and Swarm Services).

## Features

- **Modular Architecture:** Call only the components you need (`modules/container`, `modules/network`, etc.).
- **Bulk Operations:** Uses `for_each` to manage multiple resources in a single call.
- **Provider Ready:** Optimized for the `kreuzwerker/docker` provider.

## Usage

```hcl
module "docker_stack" {
  source = "btougeiro/docker-module"

  networks = {
    app_net = { name = "app-network" }
  }

  volumes = {
    db_data = { name = "database-volume" }
  }

  containers = {
    web = {
      name  = "frontend"
      image = "nginx:latest"
      networks_advanced = [{ name = "app-network" }]
      ports = [{ internal = 80, external = 8080 }]
    }
  }
}
```

## Sub-modules

- [Container](./modules/container)
- [Network](./modules/network)
- [Volume](./modules/volume)
- [Config](./modules/config)
- [Secret](./modules/secret)
- [Image](./modules/image)
- [Registry Image](./modules/registry\_image)
- [Plugin](./modules/plugin)
- [Tag](./modules/tag)
- [Buildx Builder](./modules/buildx\_builder)
- [Service (Swarm)](./modules/service)

<!-- BEGIN\_TF\_DOCS -->
# Terraform Docker Orchestrator Module

This module provides a unified, modular approach to managing Docker resources (Containers, Networks, Volumes, and Swarm Services).

## Features

- **Modular Architecture:** Call only the components you need (`modules/container`, `modules/network`, etc.).
- **Bulk Operations:** Uses `for_each` to manage multiple resources in a single call.
- **Provider Ready:** Optimized for the `kreuzwerker/docker` provider.

## Usage

```hcl
module "docker_stack" {
  source = "btougeiro/docker-module"

  networks = {
    app_net = { name = "app-network" }
  }

  volumes = {
    db_data = { name = "database-volume" }
  }

  containers = {
    web = {
      name  = "frontend"
      image = "nginx:latest"
      networks_advanced = [{ name = "app-network" }]
      ports = [{ internal = 80, external = 8080 }]
    }
  }
}
```

## Sub-modules

- [Container](./modules/container)
- [Network](./modules/network)
- [Volume](./modules/volume)
- [Config](./modules/config)
- [Secret](./modules/secret)
- [Image](./modules/image)
- [Registry Image](./modules/registry\\_image)
- [Plugin](./modules/plugin)
- [Tag](./modules/tag)
- [Buildx Builder](./modules/buildx\\_builder)
- [Service (Swarm)](./modules/service)

<!-- BEGIN\\_TF\\_DOCS -->
# Terraform Docker Orchestrator Module

This module provides a unified, modular approach to managing Docker resources (Containers, Networks, Volumes, and Swarm Services).

## Features

- **Modular Architecture:** Call only the components you need (`modules/container`, `modules/network`, etc.).
- **Bulk Operations:** Uses `for_each` to manage multiple resources in a single call.
- **Provider Ready:** Optimized for the `kreuzwerker/docker` provider.

## Usage

```hcl
module "docker_stack" {
  source = "btougeiro/docker-module"

  networks = {
    app_net = { name = "app-network" }
  }

  volumes = {
    db_data = { name = "database-volume" }
  }

  containers = {
    web = {
      name  = "frontend"
      image = "nginx:latest"
      networks_advanced = [{ name = "app-network" }]
      ports = [{ internal = 80, external = 8080 }]
    }
  }
}
```

## Sub-modules

- [Container](./modules/container)
- [Network](./modules/network)
- [Volume](./modules/volume)
- [Config](./modules/config)
- [Secret](./modules/secret)
- [Image](./modules/image)
- [Registry Image](./modules/registry\\\_image)
- [Plugin](./modules/plugin)
- [Tag](./modules/tag)
- [Buildx Builder](./modules/buildx\\\_builder)
- [Service (Swarm)](./modules/service)

<!-- BEGIN\\\_TF\\\_DOCS -->
<!-- END\\\_TF\\\_DOCS -->

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input\\_buildx\\_builders"></a> [buildx\\\_builders](#input\\\_buildx\\\_builders) | Map of buildx builder configurations | `any` | `{}` | no |
| <a name="input\\_configs"></a> [configs](#input\\\_configs) | Map of config configurations | `any` | `{}` | no |
| <a name="input\\_containers"></a> [containers](#input\\\_containers) | Map of container configurations | <pre>map(object({<br/>    name                  = string<br/>    image                 = string<br/>    attach                = optional(bool, false)<br/>    command               = optional(list(string))<br/>    cpu\\_set               = optional(string)<br/>    cpu\\_shares            = optional(number)<br/>    destroy\\_grace\\_seconds = optional(number)<br/>    dns                   = optional(list(string))<br/>    dns\\_opts              = optional(list(string))<br/>    dns\\_search            = optional(list(string))<br/>    domainname            = optional(string)<br/>    entrypoint            = optional(list(string))<br/>    env                   = optional(list(string), [])<br/>    group\\_add             = optional(list(string))<br/>    hostname              = optional(string)<br/>    init                  = optional(bool)<br/>    ipc\\_mode              = optional(string)<br/>    log\\_driver            = optional(string, "json-file")<br/>    log\\_opts              = optional(map(string))<br/>    logs                  = optional(bool, false)<br/>    max\\_retry\\_count       = optional(number)<br/>    memory                = optional(number)<br/>    memory\\_swap           = optional(number)<br/>    must\\_run              = optional(bool, true)<br/>    network\\_mode          = optional(string, "bridge")<br/>    pid\\_mode              = optional(string)<br/>    platform              = optional(string)<br/>    privileged            = optional(bool, false)<br/>    publish\\_all\\_ports     = optional(bool, false)<br/>    read\\_only             = optional(bool, false)<br/>    remove\\_volumes        = optional(bool, true)<br/>    restart               = optional(string, "no")<br/>    rm                    = optional(bool, false)<br/>    security\\_opts         = optional(list(string), [])<br/>    shm\\_size              = optional(number)<br/>    start                 = optional(bool, true)<br/>    stdin\\_open            = optional(bool, false)<br/>    storage\\_opts          = optional(map(string))<br/>    sysctls               = optional(map(string))<br/>    tmpfs                 = optional(map(string))<br/>    tty                   = optional(bool, false)<br/>    user                  = optional(string)<br/>    userns\\_mode           = optional(string)<br/>    working\\_dir           = optional(string)<br/>    capabilities = optional(list(object({<br/>      add  = optional(list(string))<br/>      drop = optional(list(string))<br/>    })), [])<br/>    devices = optional(list(object({<br/>      host\\_path      = string<br/>      container\\_path = optional(string)<br/>      permissions    = optional(string)<br/>    })), [])<br/>    healthcheck = optional(list(object({<br/>      test         = list(string)<br/>      interval     = optional(string)<br/>      retries      = optional(number)<br/>      start\\_period = optional(string)<br/>      timeout      = optional(string)<br/>    })), [])<br/>    host = optional(list(object({<br/>      host = string<br/>      ip   = string<br/>    })), [])<br/>    labels = optional(list(object({<br/>      label = string<br/>      value = string<br/>    })), [])<br/>    mounts = optional(list(object({<br/>      target    = string<br/>      type      = optional(string, "bind")<br/>      read\\_only = optional(bool)<br/>      source    = optional(string)<br/>      bind\\_options = optional(list(object({<br/>        propagation = optional(string)<br/>      })), [])<br/>      tmpfs\\_options = optional(list(object({<br/>        mode       = optional(number)<br/>        size\\_bytes = optional(number)<br/>      })), [])<br/>      volume\\_options = optional(list(object({<br/>        driver\\_name    = optional(string)<br/>        driver\\_options = optional(map(string))<br/>        labels = optional(list(object({<br/>          label = string<br/>          value = string<br/>        })), [])<br/>      })), [])<br/>    })), [])<br/>    networks\\_advanced = optional(list(object({<br/>      name         = string<br/>      aliases      = optional(list(string))<br/>      ipv4\\_address = optional(string)<br/>      ipv6\\_address = optional(string)<br/>    })), [])<br/>    ports = optional(list(object({<br/>      internal = number<br/>      external = optional(number)<br/>      ip       = optional(string, "0.0.0.0")<br/>      protocol = optional(string, "tcp")<br/>    })), [])<br/>    ulimit = optional(list(object({<br/>      name = string<br/>      hard = number<br/>      soft = number<br/>    })), [])<br/>    upload = optional(list(object({<br/>      file           = string<br/>      content        = optional(string)<br/>      content\\_base64 = optional(string)<br/>      executable     = optional(bool)<br/>      source         = optional(string)<br/>      source\\_hash    = optional(string)<br/>    })), [])<br/>    volumes = optional(list(object({<br/>      container\\_path = optional(string)<br/>      from\\_container = optional(string)<br/>      host\\_path      = optional(string)<br/>      read\\_only      = optional(bool)<br/>      volume\\_name    = optional(string)<br/>    })), [])<br/>  }))</pre> | `{}` | no |
| <a name="input\\_images"></a> [images](#input\\\_images) | Map of image configurations | `any` | `{}` | no |
| <a name="input\\_networks"></a> [networks](#input\\\_networks) | Map of network configurations. Key is the logical name, value is the configuration object. | <pre>map(object({<br/>    name        = string<br/>    create      = optional(bool, true)<br/>    attachable  = optional(bool)<br/>    driver      = optional(string, "bridge")<br/>    ingress     = optional(bool)<br/>    internal    = optional(bool)<br/>    ipam\\_driver = optional(string, "default")<br/>    ipv6        = optional(bool)<br/>    options     = optional(map(string))<br/>    ipam\\_config = optional(list(object({<br/>      aux\\_address = optional(map(string))<br/>      gateway     = optional(string)<br/>      ip\\_range    = optional(string)<br/>      subnet      = optional(string)<br/>    })), [])<br/>    labels = optional(list(object({<br/>      label = string<br/>      value = string<br/>    })), [])<br/>  }))</pre> | `{}` | no |
| <a name="input\\_plugins"></a> [plugins](#input\\\_plugins) | Map of plugin configurations | `any` | `{}` | no |
| <a name="input\\_registry\\_images"></a> [registry\\\_images](#input\\\_registry\\\_images) | Map of registry image configurations | `any` | `{}` | no |
| <a name="input\\_secrets"></a> [secrets](#input\\\_secrets) | Map of secret configurations | `any` | `{}` | no |
| <a name="input\\_services"></a> [services](#input\\\_services) | Map of service configurations | `any` | `{}` | no |
| <a name="input\\_tags"></a> [tags](#input\\\_tags) | Map of tag configurations | `any` | `{}` | no |
| <a name="input\\_volumes"></a> [volumes](#input\\\_volumes) | Map of volume configurations. Key is the logical name, value is the configuration object. | <pre>map(object({<br/>    name        = string<br/>    create      = optional(bool, true)<br/>    driver      = optional(string, "local")<br/>    driver\\_opts = optional(map(string))<br/>    labels = optional(list(object({<br/>      label = string<br/>      value = string<br/>    })), [])<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output\\_buildx\\_builders"></a> [buildx\\\_builders](#output\\\_buildx\\\_builders) | A map of all buildx builder resources managed by this module. |
| <a name="output\\_configs"></a> [configs](#output\\\_configs) | A map of all Docker config resources managed by this module. |
| <a name="output\\_containers"></a> [containers](#output\\\_containers) | A map of all container resources managed by this module. |
| <a name="output\\_images"></a> [images](#output\\\_images) | A map of all Docker image resources managed by this module. |
| <a name="output\\_networks"></a> [networks](#output\\\_networks) | A map of all network resources, both created and referenced. |
| <a name="output\\_plugins"></a> [plugins](#output\\\_plugins) | A map of all Docker plugin resources managed by this module. |
| <a name="output\\_registry\\_images"></a> [registry\\\_images](#output\\\_registry\\\_images) | A map of all Docker registry image resources managed by this module. |
| <a name="output\\_secrets"></a> [secrets](#output\\\_secrets) | A map of all Docker secret resources managed by this module. |
| <a name="output\\_services"></a> [services](#output\\\_services) | A map of all Swarm service resources managed by this module. |
| <a name="output\\_tags"></a> [tags](#output\\\_tags) | A map of all Docker tag resources managed by this module. |
| <a name="output\\_volumes"></a> [volumes](#output\\\_volumes) | A map of all volume resources created by this module. |
<!-- END\\_TF\\_DOCS -->

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input\_buildx\_builders"></a> [buildx\\_builders](#input\\_buildx\\_builders) | Map of buildx builder configurations | `any` | `{}` | no |
| <a name="input\_configs"></a> [configs](#input\\_configs) | Map of config configurations | `any` | `{}` | no |
| <a name="input\_containers"></a> [containers](#input\\_containers) | Map of container configurations | <pre>map(object({<br/>    name                  = string<br/>    image                 = string<br/>    attach                = optional(bool, false)<br/>    command               = optional(list(string))<br/>    cpu\_set               = optional(string)<br/>    cpu\_shares            = optional(number)<br/>    destroy\_grace\_seconds = optional(number)<br/>    dns                   = optional(list(string))<br/>    dns\_opts              = optional(list(string))<br/>    dns\_search            = optional(list(string))<br/>    domainname            = optional(string)<br/>    entrypoint            = optional(list(string))<br/>    env                   = optional(list(string), [])<br/>    group\_add             = optional(list(string))<br/>    hostname              = optional(string)<br/>    init                  = optional(bool)<br/>    ipc\_mode              = optional(string)<br/>    log\_driver            = optional(string, "json-file")<br/>    log\_opts              = optional(map(string))<br/>    logs                  = optional(bool, false)<br/>    max\_retry\_count       = optional(number)<br/>    memory                = optional(number)<br/>    memory\_swap           = optional(number)<br/>    must\_run              = optional(bool, true)<br/>    network\_mode          = optional(string, "bridge")<br/>    pid\_mode              = optional(string)<br/>    platform              = optional(string)<br/>    privileged            = optional(bool, false)<br/>    publish\_all\_ports     = optional(bool, false)<br/>    read\_only             = optional(bool, false)<br/>    remove\_volumes        = optional(bool, true)<br/>    restart               = optional(string, "no")<br/>    rm                    = optional(bool, false)<br/>    security\_opts         = optional(list(string), [])<br/>    shm\_size              = optional(number)<br/>    start                 = optional(bool, true)<br/>    stdin\_open            = optional(bool, false)<br/>    storage\_opts          = optional(map(string))<br/>    sysctls               = optional(map(string))<br/>    tmpfs                 = optional(map(string))<br/>    tty                   = optional(bool, false)<br/>    user                  = optional(string)<br/>    userns\_mode           = optional(string)<br/>    working\_dir           = optional(string)<br/>    capabilities = optional(list(object({<br/>      add  = optional(list(string))<br/>      drop = optional(list(string))<br/>    })), [])<br/>    devices = optional(list(object({<br/>      host\_path      = string<br/>      container\_path = optional(string)<br/>      permissions    = optional(string)<br/>    })), [])<br/>    healthcheck = optional(list(object({<br/>      test         = list(string)<br/>      interval     = optional(string)<br/>      retries      = optional(number)<br/>      start\_period = optional(string)<br/>      timeout      = optional(string)<br/>    })), [])<br/>    host = optional(list(object({<br/>      host = string<br/>      ip   = string<br/>    })), [])<br/>    labels = optional(list(object({<br/>      label = string<br/>      value = string<br/>    })), [])<br/>    mounts = optional(list(object({<br/>      target    = string<br/>      type      = optional(string, "bind")<br/>      read\_only = optional(bool)<br/>      source    = optional(string)<br/>      bind\_options = optional(list(object({<br/>        propagation = optional(string)<br/>      })), [])<br/>      tmpfs\_options = optional(list(object({<br/>        mode       = optional(number)<br/>        size\_bytes = optional(number)<br/>      })), [])<br/>      volume\_options = optional(list(object({<br/>        driver\_name    = optional(string)<br/>        driver\_options = optional(map(string))<br/>        labels = optional(list(object({<br/>          label = string<br/>          value = string<br/>        })), [])<br/>      })), [])<br/>    })), [])<br/>    networks\_advanced = optional(list(object({<br/>      name         = string<br/>      aliases      = optional(list(string))<br/>      ipv4\_address = optional(string)<br/>      ipv6\_address = optional(string)<br/>    })), [])<br/>    ports = optional(list(object({<br/>      internal = number<br/>      external = optional(number)<br/>      ip       = optional(string, "0.0.0.0")<br/>      protocol = optional(string, "tcp")<br/>    })), [])<br/>    ulimit = optional(list(object({<br/>      name = string<br/>      hard = number<br/>      soft = number<br/>    })), [])<br/>    upload = optional(list(object({<br/>      file           = string<br/>      content        = optional(string)<br/>      content\_base64 = optional(string)<br/>      executable     = optional(bool)<br/>      source         = optional(string)<br/>      source\_hash    = optional(string)<br/>    })), [])<br/>    volumes = optional(list(object({<br/>      container\_path = optional(string)<br/>      from\_container = optional(string)<br/>      host\_path      = optional(string)<br/>      read\_only      = optional(bool)<br/>      volume\_name    = optional(string)<br/>    })), [])<br/>  }))</pre> | `{}` | no |
| <a name="input\_images"></a> [images](#input\\_images) | Map of image configurations | `any` | `{}` | no |
| <a name="input\_networks"></a> [networks](#input\\_networks) | Map of network configurations. Key is the logical name, value is the configuration object. | <pre>map(object({<br/>    name        = string<br/>    create      = optional(bool, true)<br/>    attachable  = optional(bool)<br/>    driver      = optional(string, "bridge")<br/>    ingress     = optional(bool)<br/>    internal    = optional(bool)<br/>    ipam\_driver = optional(string, "default")<br/>    ipv6        = optional(bool)<br/>    options     = optional(map(string))<br/>    ipam\_config = optional(list(object({<br/>      aux\_address = optional(map(string))<br/>      gateway     = optional(string)<br/>      ip\_range    = optional(string)<br/>      subnet      = optional(string)<br/>    })), [])<br/>    labels = optional(list(object({<br/>      label = string<br/>      value = string<br/>    })), [])<br/>  }))</pre> | `{}` | no |
| <a name="input\_plugins"></a> [plugins](#input\\_plugins) | Map of plugin configurations | `any` | `{}` | no |
| <a name="input\_registry\_images"></a> [registry\\_images](#input\\_registry\\_images) | Map of registry image configurations | `any` | `{}` | no |
| <a name="input\_secrets"></a> [secrets](#input\\_secrets) | Map of secret configurations | `any` | `{}` | no |
| <a name="input\_services"></a> [services](#input\\_services) | Map of service configurations | `any` | `{}` | no |
| <a name="input\_tags"></a> [tags](#input\\_tags) | Map of tag configurations | `any` | `{}` | no |
| <a name="input\_volumes"></a> [volumes](#input\\_volumes) | Map of volume configurations. Key is the logical name, value is the configuration object. | <pre>map(object({<br/>    name        = string<br/>    create      = optional(bool, true)<br/>    driver      = optional(string, "local")<br/>    driver\_opts = optional(map(string))<br/>    labels = optional(list(object({<br/>      label = string<br/>      value = string<br/>    })), [])<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output\_buildx\_builders"></a> [buildx\\_builders](#output\\_buildx\\_builders) | A map of all buildx builder resources managed by this module. |
| <a name="output\_configs"></a> [configs](#output\\_configs) | A map of all Docker config resources managed by this module. |
| <a name="output\_containers"></a> [containers](#output\\_containers) | A map of all container resources managed by this module. |
| <a name="output\_images"></a> [images](#output\\_images) | A map of all Docker image resources managed by this module. |
| <a name="output\_networks"></a> [networks](#output\\_networks) | A map of all network resources, both created and referenced. |
| <a name="output\_plugins"></a> [plugins](#output\\_plugins) | A map of all Docker plugin resources managed by this module. |
| <a name="output\_registry\_images"></a> [registry\\_images](#output\\_registry\\_images) | A map of all Docker registry image resources managed by this module. |
| <a name="output\_secrets"></a> [secrets](#output\\_secrets) | A map of all Docker secret resources managed by this module. |
| <a name="output\_services"></a> [services](#output\\_services) | A map of all Swarm service resources managed by this module. |
| <a name="output\_tags"></a> [tags](#output\\_tags) | A map of all Docker tag resources managed by this module. |
| <a name="output\_volumes"></a> [volumes](#output\\_volumes) | A map of all volume resources created by this module. |
<!-- END\_TF\_DOCS -->

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
