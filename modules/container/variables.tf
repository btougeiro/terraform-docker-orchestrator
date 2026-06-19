variable "containers" {
  description = "Map of container configurations. Key is the logical name, value is the configuration object."
  type = map(object({
    name                  = string
    image                 = string
    attach                = optional(bool, false)
    command               = optional(list(string))
    cpu_set               = optional(string)
    cpu_shares            = optional(number)
    destroy_grace_seconds = optional(number)
    dns                   = optional(list(string))
    dns_opts              = optional(list(string))
    dns_search            = optional(list(string))
    domainname            = optional(string)
    entrypoint            = optional(list(string))
    env                   = optional(list(string), [])
    group_add             = optional(list(string))
    hostname              = optional(string)
    init                  = optional(bool)
    ipc_mode              = optional(string)
    log_driver            = optional(string, "json-file")
    log_opts              = optional(map(string))
    logs                  = optional(bool, false)
    max_retry_count       = optional(number)
    memory                = optional(number)
    memory_swap           = optional(number)
    must_run              = optional(bool, true)
    network_mode          = optional(string, "bridge")
    pid_mode              = optional(string)
    platform              = optional(string)
    privileged            = optional(bool, false)
    publish_all_ports     = optional(bool, false)
    read_only             = optional(bool, false)
    remove_volumes        = optional(bool, true)
    restart               = optional(string, "no")
    rm                    = optional(bool, false)
    security_opts         = optional(list(string), [])
    shm_size              = optional(number)
    start                 = optional(bool, true)
    stdin_open            = optional(bool, false)
    storage_opts          = optional(map(string))
    sysctls               = optional(map(string))
    tmpfs                 = optional(map(string))
    tty                   = optional(bool, false)
    user                  = optional(string)
    userns_mode           = optional(string)
    working_dir           = optional(string)
    capabilities = optional(list(object({
      add  = optional(list(string))
      drop = optional(list(string))
    })), [])
    devices = optional(list(object({
      host_path      = string
      container_path = optional(string)
      permissions    = optional(string)
    })), [])
    healthcheck = optional(list(object({
      test         = list(string)
      interval     = optional(string)
      retries      = optional(number)
      start_period = optional(string)
      timeout      = optional(string)
    })), [])
    host = optional(list(object({
      host = string
      ip   = string
    })), [])
    labels = optional(list(object({
      label = string
      value = string
    })), [])
    mounts = optional(list(object({
      target    = string
      type      = optional(string, "bind")
      read_only = optional(bool)
      source    = optional(string)
      bind_options = optional(list(object({
        propagation = optional(string)
      })), [])
      tmpfs_options = optional(list(object({
        mode       = optional(number)
        size_bytes = optional(number)
      })), [])
      volume_options = optional(list(object({
        driver_name    = optional(string)
        driver_options = optional(map(string))
        labels = optional(list(object({
          label = string
          value = string
        })), [])
      })), [])
    })), [])
    networks_advanced = optional(list(object({
      name         = string
      aliases      = optional(list(string))
      ipv4_address = optional(string)
      ipv6_address = optional(string)
    })), [])
    ports = optional(list(object({
      internal = number
      external = optional(number)
      ip       = optional(string, "0.0.0.0")
      protocol = optional(string, "tcp")
    })), [])
    ulimit = optional(list(object({
      name = string
      hard = number
      soft = number
    })), [])
    upload = optional(list(object({
      file           = string
      content        = optional(string)
      content_base64 = optional(string)
      executable     = optional(bool)
      source         = optional(string)
      source_hash    = optional(string)
    })), [])
    volumes = optional(list(object({
      container_path = optional(string)
      from_container = optional(string)
      host_path      = optional(string)
      read_only      = optional(bool)
      volume_name    = optional(string)
    })), [])
  }))
  default = {}

  validation {
    condition     = alltrue([for c in var.containers : contains(["no", "always", "on-failure", "unless-stopped"], c.restart)])
    error_message = "The restart policy must be one of: no, always, on-failure, unless-stopped."
  }
}
