# -----------------------------------------------------------------------------
# DOCKER CONTAINER SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_container" "this" {
  for_each = var.containers

  # Basic Configuration
  name  = each.value.name
  image = each.value.image

  # Container Runtime Control
  attach                = lookup(each.value, "attach", false)
  command               = lookup(each.value, "command", null)
  cpu_set               = lookup(each.value, "cpu_set", null)
  cpu_shares            = lookup(each.value, "cpu_shares", null)
  destroy_grace_seconds = lookup(each.value, "destroy_grace_seconds", null)
  dns                   = lookup(each.value, "dns", null)
  dns_opts              = lookup(each.value, "dns_opts", null)
  dns_search            = lookup(each.value, "dns_search", null)
  domainname            = lookup(each.value, "domainname", null)
  entrypoint            = lookup(each.value, "entrypoint", null)
  env                   = lookup(each.value, "env", [])
  group_add             = lookup(each.value, "group_add", null)
  hostname              = lookup(each.value, "hostname", null)
  init                  = lookup(each.value, "init", null)
  ipc_mode              = lookup(each.value, "ipc_mode", null)
  log_driver            = lookup(each.value, "log_driver", "json-file")
  log_opts              = lookup(each.value, "log_opts", null)
  logs                  = lookup(each.value, "logs", false)
  max_retry_count       = lookup(each.value, "max_retry_count", null)
  memory                = lookup(each.value, "memory", null)
  memory_swap           = lookup(each.value, "memory_swap", null)
  must_run              = lookup(each.value, "must_run", true)
  network_mode          = lookup(each.value, "network_mode", "bridge")
  pid_mode              = lookup(each.value, "pid_mode", null)
  platform              = lookup(each.value, "platform", null)
  privileged            = lookup(each.value, "privileged", false)
  publish_all_ports     = lookup(each.value, "publish_all_ports", false)
  read_only             = lookup(each.value, "read_only", false)
  remove_volumes        = lookup(each.value, "remove_volumes", true)
  restart               = lookup(each.value, "restart", "no")
  rm                    = lookup(each.value, "rm", false)
  security_opts         = lookup(each.value, "security_opts", [])
  shm_size              = lookup(each.value, "shm_size", null)
  start                 = lookup(each.value, "start", true)
  stdin_open            = lookup(each.value, "stdin_open", false)
  storage_opts          = lookup(each.value, "storage_opts", null)
  sysctls               = lookup(each.value, "sysctls", null)
  tmpfs                 = lookup(each.value, "tmpfs", null)
  tty                   = lookup(each.value, "tty", false)
  user                  = lookup(each.value, "user", null)
  userns_mode           = lookup(each.value, "userns_mode", null)
  working_dir           = lookup(each.value, "working_dir", null)

  # Dynamic Blocks for Complex Objects
  dynamic "capabilities" {
    for_each = lookup(each.value, "capabilities", [])
    content {
      add  = lookup(capabilities.value, "add", null)
      drop = lookup(capabilities.value, "drop", null)
    }
  }

  dynamic "devices" {
    for_each = lookup(each.value, "devices", [])
    content {
      host_path      = lookup(devices.value, "host_path", null)
      container_path = lookup(devices.value, "container_path", null)
      permissions    = lookup(devices.value, "permissions", null)
    }
  }

  dynamic "healthcheck" {
    for_each = lookup(each.value, "healthcheck", [])
    content {
      test         = lookup(healthcheck.value, "test", null)
      interval     = lookup(healthcheck.value, "interval", null)
      retries      = lookup(healthcheck.value, "retries", null)
      start_period = lookup(healthcheck.value, "start_period", null)
      timeout      = lookup(healthcheck.value, "timeout", null)
    }
  }

  dynamic "host" {
    for_each = lookup(each.value, "host", [])
    content {
      host = lookup(host.value, "host", null)
      ip   = lookup(host.value, "ip", null)
    }
  }

  dynamic "labels" {
    for_each = lookup(each.value, "labels", [])
    content {
      label = lookup(labels.value, "label", null)
      value = lookup(labels.value, "value", null)
    }
  }

  dynamic "mounts" {
    for_each = lookup(each.value, "mounts", [])
    content {
      target    = lookup(mounts.value, "target", null)
      type      = lookup(mounts.value, "type", "bind")
      read_only = lookup(mounts.value, "read_only", null)
      source    = lookup(mounts.value, "source", null)

      dynamic "bind_options" {
        for_each = lookup(mounts.value, "bind_options", [])
        content {
          propagation = lookup(bind_options.value, "propagation", null)
        }
      }

      dynamic "tmpfs_options" {
        for_each = lookup(mounts.value, "tmpfs_options", [])
        content {
          mode       = lookup(tmpfs_options.value, "mode", null)
          size_bytes = lookup(tmpfs_options.value, "size_bytes", null)
        }
      }

      dynamic "volume_options" {
        for_each = lookup(mounts.value, "volume_options", [])
        content {
          driver_name    = lookup(volume_options.value, "driver_name", null)
          driver_options = lookup(volume_options.value, "driver_options", null)
          dynamic "labels" {
            for_each = lookup(volume_options.value, "labels", [])
            content {
              label = lookup(labels.value, "label", null)
              value = lookup(labels.value, "value", null)
            }
          }
        }
      }
    }
  }

  dynamic "networks_advanced" {
    for_each = lookup(each.value, "networks_advanced", [])
    content {
      name         = lookup(networks_advanced.value, "name", null)
      aliases      = lookup(networks_advanced.value, "aliases", null)
      ipv4_address = lookup(networks_advanced.value, "ipv4_address", null)
      ipv6_address = lookup(networks_advanced.value, "ipv6_address", null)
    }
  }

  dynamic "ports" {
    for_each = lookup(each.value, "ports", [])
    content {
      internal = lookup(ports.value, "internal", null)
      external = lookup(ports.value, "external", null)
      ip       = lookup(ports.value, "ip", "0.0.0.0")
      protocol = lookup(ports.value, "protocol", "tcp")
    }
  }

  dynamic "ulimit" {
    for_each = lookup(each.value, "ulimit", [])
    content {
      name = lookup(ulimit.value, "name", null)
      hard = lookup(ulimit.value, "hard", null)
      soft = lookup(ulimit.value, "soft", null)
    }
  }

  dynamic "upload" {
    for_each = lookup(each.value, "upload", [])
    content {
      file           = lookup(upload.value, "file", null)
      content        = lookup(upload.value, "content", null)
      content_base64 = lookup(upload.value, "content_base64", null)
      executable     = lookup(upload.value, "executable", null)
      source         = lookup(upload.value, "source", null)
      source_hash    = lookup(upload.value, "source_hash", null)
    }
  }

  dynamic "volumes" {
    for_each = lookup(each.value, "volumes", [])
    content {
      container_path = lookup(volumes.value, "container_path", null)
      from_container = lookup(volumes.value, "from_container", null)
      host_path      = lookup(volumes.value, "host_path", null)
      read_only      = lookup(volumes.value, "read_only", null)
      volume_name    = lookup(volumes.value, "volume_name", null)
    }
  }
}
