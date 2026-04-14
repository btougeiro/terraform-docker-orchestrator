# -----------------------------------------------------------------------------
# DOCKER CONTAINER SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_container" "this" {
  for_each = var.containers

  # Basic Configuration
  name  = each.value.name
  image = each.value.image

  # Container Runtime Control
  attach                = each.value.attach
  command               = each.value.command
  cpu_set               = each.value.cpu_set
  cpu_shares            = each.value.cpu_shares
  destroy_grace_seconds = each.value.destroy_grace_seconds
  dns                   = each.value.dns
  dns_opts              = each.value.dns_opts
  dns_search            = each.value.dns_search
  domainname            = each.value.domainname
  entrypoint            = each.value.entrypoint
  env                   = each.value.env
  group_add             = each.value.group_add
  hostname              = each.value.hostname
  init                  = each.value.init
  ipc_mode              = each.value.ipc_mode
  log_driver            = each.value.log_driver
  log_opts              = each.value.log_opts
  logs                  = each.value.logs
  max_retry_count       = each.value.max_retry_count
  memory                = each.value.memory
  memory_swap           = each.value.memory_swap
  must_run              = each.value.must_run
  network_mode          = each.value.network_mode
  pid_mode              = each.value.pid_mode
  platform              = each.value.platform
  privileged            = each.value.privileged
  publish_all_ports     = each.value.publish_all_ports
  read_only             = each.value.read_only
  remove_volumes        = each.value.remove_volumes
  restart               = each.value.restart
  rm                    = each.value.rm
  security_opts         = each.value.security_opts
  shm_size              = each.value.shm_size
  start                 = each.value.start
  stdin_open            = each.value.stdin_open
  storage_opts          = each.value.storage_opts
  sysctls               = each.value.sysctls
  tmpfs                 = each.value.tmpfs
  tty                   = each.value.tty
  user                  = each.value.user
  userns_mode           = each.value.userns_mode
  working_dir           = each.value.working_dir

  # Dynamic Blocks for Complex Objects
  dynamic "capabilities" {
    for_each = each.value.capabilities
    content {
      add  = capabilities.value.add
      drop = capabilities.value.drop
    }
  }

  dynamic "devices" {
    for_each = each.value.devices
    content {
      host_path      = devices.value.host_path
      container_path = devices.value.container_path
      permissions    = devices.value.permissions
    }
  }

  dynamic "healthcheck" {
    for_each = each.value.healthcheck
    content {
      test         = healthcheck.value.test
      interval     = healthcheck.value.interval
      retries      = healthcheck.value.retries
      start_period = healthcheck.value.start_period
      timeout      = healthcheck.value.timeout
    }
  }

  dynamic "host" {
    for_each = each.value.host
    content {
      host = host.value.host
      ip   = host.value.ip
    }
  }

  dynamic "labels" {
    for_each = each.value.labels
    content {
      label = labels.value.label
      value = labels.value.value
    }
  }

  dynamic "mounts" {
    for_each = each.value.mounts
    content {
      target    = mounts.value.target
      type      = mounts.value.type
      read_only = mounts.value.read_only
      source    = mounts.value.source

      dynamic "bind_options" {
        for_each = mounts.value.bind_options
        content {
          propagation = bind_options.value.propagation
        }
      }

      dynamic "tmpfs_options" {
        for_each = mounts.value.tmpfs_options
        content {
          mode       = tmpfs_options.value.mode
          size_bytes = tmpfs_options.value.size_bytes
        }
      }

      dynamic "volume_options" {
        for_each = mounts.value.volume_options
        content {
          driver_name    = volume_options.value.driver_name
          driver_options = volume_options.value.driver_options
          dynamic "labels" {
            for_each = volume_options.value.labels
            content {
              label = labels.value.label
              value = labels.value.value
            }
          }
        }
      }
    }
  }

  dynamic "networks_advanced" {
    for_each = each.value.networks_advanced
    content {
      name         = networks_advanced.value.name
      aliases      = networks_advanced.value.aliases
      ipv4_address = networks_advanced.value.ipv4_address
      ipv6_address = networks_advanced.value.ipv6_address
    }
  }

  dynamic "ports" {
    for_each = each.value.ports
    content {
      internal = ports.value.internal
      external = ports.value.external
      ip       = ports.value.ip
      protocol = ports.value.protocol
    }
  }

  dynamic "ulimit" {
    for_each = each.value.ulimit
    content {
      name = ulimit.value.name
      hard = ulimit.value.hard
      soft = ulimit.value.soft
    }
  }

  dynamic "upload" {
    for_each = each.value.upload
    content {
      file           = upload.value.file
      content        = upload.value.content
      content_base64 = upload.value.content_base64
      executable     = upload.value.executable
      source         = upload.value.source
      source_hash    = upload.value.source_hash
    }
  }

  dynamic "volumes" {
    for_each = each.value.volumes
    content {
      container_path = volumes.value.container_path
      from_container = volumes.value.from_container
      host_path      = volumes.value.host_path
      read_only      = volumes.value.read_only
      volume_name    = volumes.value.volume_name
    }
  }
}
