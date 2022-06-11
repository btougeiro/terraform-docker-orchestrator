# -----------------------------------------------------------------------------
# MAIN
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# DOCKER CONFIG
# -----------------------------------------------------------------------------

resource "docker_config" "this" {
  count = var.create_docker_config ? 1 : 0
  data  = var.config_data
  name  = var.config_name
}

# -----------------------------------------------------------------------------
# DOCKER CONTAINER
# -----------------------------------------------------------------------------

resource "docker_container" "this" {
  count  = var.create_docker_container ? 1 : 0
  image  = var.container_image
  name   = var.container_name
  attach = var.container_attach
  dynamic "capabilities" {
    for_each = var.container_capabilities
    content {
      add  = lookup(capabilities.value, "add", null)
      drop = lookup(capabilities.value, "drop", null)
    }
  }
  command               = var.container_command
  cpu_set               = var.container_cpu_set
  cpu_shares            = var.container_cpu_shares
  destroy_grace_seconds = var.container_destroy_grace_seconds
  dynamic "devices" {
    for_each = var.container_devices
    content {
      host_path      = lookup(devices.value, "host_path", null)
      container_path = lookup(devices.value, "container_path", null)
      permissions    = lookup(devices.value, "permissions", null)
    }
  }
  dns        = var.container_dns
  dns_opts   = var.container_dns_opts
  dns_search = var.container_dns_search
  domainname = var.container_domainname
  entrypoint = var.container_entrypoint
  env        = var.container_env
  group_add  = var.container_group_add
  dynamic "healthcheck" {
    for_each = var.container_healthcheck
    content {
      test         = lookup(healthcheck.value, "test", null)
      interval     = lookup(healthcheck.value, "interval", null)
      retries      = lookup(healthcheck.value, "retries", null)
      start_period = lookup(healthcheck.value, "start_period", null)
      timeout      = lookup(healthcheck.value, "timeout", null)
    }
  }
  dynamic "host" {
    for_each = var.container_host
    content {
      host = lookup(host.value, "host", null)
      ip   = lookup(host.value, "ip", null)
    }
  }
  hostname = var.container_hostname
  init     = var.container_init
  ipc_mode = var.container_ipc_mode
  dynamic "labels" {
    for_each = var.container_labels
    content {
      label = lookup(labels.value, "label", null)
      value = lookup(labels.value, "value", null)
    }
  }
  log_driver      = var.container_log_driver
  log_opts        = var.container_log_opts
  logs            = var.container_logs
  max_retry_count = var.container_max_retry_count
  memory          = var.container_memory
  memory_swap     = var.container_memory_swap
  dynamic "mounts" {
    for_each = var.container_mounts
    content {
      target = lookup(mounts.value, "target", null)
      type   = lookup(mounts.value, "type", null)
      dynamic "bind_options" {
        for_each = lookup(mounts.value, "bind_options", [])
        content {
          propagation = lookup(bind_options.value, "propagation", null)
        }
      }
      read_only = lookup(mounts.value, "read_only", null)
      source    = lookup(mounts.value, "source", null)
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
  must_run     = var.container_must_run
  network_mode = var.container_network_mode
  dynamic "networks_advanced" {
    for_each = var.container_networks_advanced
    content {
      name         = lookup(networks_advanced.value, "name", null)
      aliases      = lookup(networks_advanced.value, "aliases", null)
      ipv4_address = lookup(networks_advanced.value, "ipv4_address", null)
      ipv6_address = lookup(networks_advanced.value, "ipv6_address", null)
    }
  }
  pid_mode = var.container_pid_mode
  dynamic "ports" {
    for_each = var.container_ports
    content {
      internal = lookup(ports.value, "internal", null)
      external = lookup(ports.value, "external", null)
      ip       = lookup(ports.value, "ip", null)
      protocol = lookup(ports.value, "protocol", null)
    }
  }
  privileged        = var.container_privileged
  publish_all_ports = var.container_publish_all_ports
  read_only         = var.container_read_only
  remove_volumes    = var.container_remove_volumes
  restart           = var.container_restart
  rm                = var.container_rm
  security_opts     = var.container_security_opts
  shm_size          = var.container_shm_size
  start             = var.container_start
  stdin_open        = var.container_stdin_open
  storage_opts      = var.container_storage_opts
  sysctls           = var.container_sysctls
  tmpfs             = var.container_tmpfs
  tty               = var.container_tty
  dynamic "ulimit" {
    for_each = var.container_ulimit
    content {
      name = lookup(ulimit.value, "name", null)
      hard = lookup(ulimit.value, "hard", null)
      soft = lookup(ulimit.value, "soft", null)
    }
  }
  dynamic "upload" {
    for_each = var.container_upload
    content {
      file           = lookup(upload.value, "file", null)
      content        = lookup(upload.value, "content", null)
      content_base64 = lookup(upload.value, "content_base64", null)
      executable     = lookup(upload.value, "executable", null)
      source         = lookup(upload.value, "source", null)
      source_hash    = lookup(upload.value, "source_hash", null)
    }
  }
  user        = var.container_user
  userns_mode = var.container_userns_mode
  dynamic "volumes" {
    for_each = var.container_volumes
    content {
      container_path = lookup(volumes.value, "container_path", null)
      from_container = lookup(volumes.value, "from_container", null)
      host_path      = lookup(volumes.value, "host_path", null)
      read_only      = lookup(volumes.value, "read_only", null)
      volume_name    = lookup(volumes.value, "volume_name", null)
    }
  }
  working_dir = var.container_working_dir
}

# -----------------------------------------------------------------------------
# DOCKER IMAGE
# -----------------------------------------------------------------------------

resource "docker_image" "this" {
  count = var.image_pull ? 1 : 0
  name  = var.image_name
  //noinspection ConflictingProperties
  dynamic "build" {
    for_each = var.build
    content {
      path         = lookup(build.value, "path", null)
      build_arg    = lookup(build.value, "build_arg", null)
      dockerfile   = lookup(build.value, "dockerfile", null)
      force_remove = lookup(build.value, "force_remove", null)
      label        = lookup(build.value, "label", null)
      no_cache     = lookup(build.value, "no_cache", null)
      remove       = lookup(build.value, "remove", null)
      tag          = lookup(build.value, "tag", null)
      target       = lookup(build.value, "target", null)
    }
  }
  force_remove  = var.image_force_remove
  keep_locally  = var.image_keep_locally
  pull_triggers = length(var.build) > 0 ? [] : var.image_pull_triggers
}

# -----------------------------------------------------------------------------
# DOCKER NETWORK
# -----------------------------------------------------------------------------

resource "docker_network" "this" {
  count           = var.create_docker_network ? 1 : 0
  name            = var.network_name
  attachable      = var.network_attachable
  check_duplicate = var.network_check_duplicate
  driver          = var.network_driver
  ingress         = var.network_ingress
  internal        = var.network_internal
  dynamic "ipam_config" {
    for_each = var.network_ipam_config
    content {
      aux_address = lookup(ipam_config.value, "aux_address", null)
      gateway     = lookup(ipam_config.value, "gateway", null)
      ip_range    = lookup(ipam_config.value, "ip_range", null)
      subnet      = lookup(ipam_config.value, "subnet", null)
    }
  }
  ipam_driver = var.network_ipam_driver
  ipv6        = var.network_ipv6
  dynamic "labels" {
    for_each = var.network_labels
    content {
      label = lookup(labels.value, "label", null)
      value = lookup(labels.value, "value", null)
    }
  }
  options = var.network_options
}

# -----------------------------------------------------------------------------
# DOCKER PLUGIN
# -----------------------------------------------------------------------------

//noinspection ConflictingProperties
resource "docker_plugin" "this" {
  count                 = var.create_docker_plugin ? 1 : 0
  name                  = var.plugin_name
  alias                 = var.plugin_alias
  enable_timeout        = var.plugin_enable_timeout
  enabled               = var.plugin_enabled
  env                   = var.plugin_env
  force_destroy         = var.plugin_force_destroy
  force_disable         = var.plugin_force_disable
  grant_all_permissions = var.plugin_grant_all_permissions
  //noinspection ConflictingProperties
  dynamic "grant_permissions" {
    for_each = var.plugin_grant_permissions
    content {
      name  = lookup(grant_permissions.value, "name", null)
      value = lookup(grant_permissions.value, "value", null)
    }
  }
}

# -----------------------------------------------------------------------------
# DOCKER REGISTRY IMAGE
# -----------------------------------------------------------------------------

resource "docker_registry_image" "this" {
  count = var.create_registry_image ? 1 : 0
  name  = var.registry_image_name
  dynamic "build" {
    for_each = var.registry_image_build
    content {
      context = lookup(build.value, "context", null)
      dynamic "auth_config" {
        for_each = lookup(build.value, "auth_config", [])
        content {
          host_name      = lookup(auth_config.value, "host_name", null)
          auth           = lookup(auth_config.value, "auth", null)
          email          = lookup(auth_config.value, "email", null)
          identity_token = lookup(auth_config.value, "identity_token", null)
          password       = lookup(auth_config.value, "password", null)
          registry_token = lookup(auth_config.value, "registry_token", null)
          server_address = lookup(auth_config.value, "server_address", null)
          user_name      = lookup(auth_config.value, "user_name", null)
        }
      }
      build_args      = lookup(build.value, "build_args", null)
      build_id        = lookup(build.value, "build_id", null)
      cache_from      = lookup(build.value, "cache_from", null)
      cgroup_parent   = lookup(build.value, "cgroup_parent", null)
      cpu_period      = lookup(build.value, "cpu_period", null)
      cpu_quota       = lookup(build.value, "cpu_quota", null)
      cpu_set_cpus    = lookup(build.value, "cpu_set_cpus", null)
      cpu_set_mems    = lookup(build.value, "cpu_set_mems", null)
      dockerfile      = lookup(build.value, "dockerfile", null)
      extra_hosts     = lookup(build.value, "extra_hosts", null)
      force_remove    = lookup(build.value, "force_remove", true)
      isolation       = lookup(build.value, "isolation", null)
      labels          = lookup(build.value, "labels", null)
      memory          = lookup(build.value, "memory", null)
      memory_swap     = lookup(build.value, "memory_swap", null)
      network_mode    = lookup(build.value, "network_mode", null)
      no_cache        = lookup(build.value, "no_cache", null)
      platform        = lookup(build.value, "platform", null)
      pull_parent     = lookup(build.value, "pull_parent", null)
      remote_context  = lookup(build.value, "remote_context", null)
      remove          = lookup(build.value, "remove", null)
      security_opt    = lookup(build.value, "security_opt", null)
      session_id      = lookup(build.value, "session_id", null)
      shm_size        = lookup(build.value, "shm_size", null)
      squash          = lookup(build.value, "squash", null)
      suppress_output = lookup(build.value, "suppress_output", null)
      target          = lookup(build.value, "target", null)
      dynamic "ulimit" {
        for_each = lookup(build.value, "ulimit", [])
        content {
          hard = lookup(ulimit.value, "hard", null)
          name = lookup(ulimit.value, "name", null)
          soft = lookup(ulimit.value, "soft", null)
        }
      }
      version = lookup(build.value, "version", null)
    }
  }
  insecure_skip_verify = var.registry_image_insecure_skip_verify
  keep_remotely        = var.registry_image_keep_remotely
}

# -----------------------------------------------------------------------------
# DOCKER SECRET
# -----------------------------------------------------------------------------

resource "docker_secret" "this" {
  count = var.create_docker_secret && var.create_docker_service ? 1 : 0
  data  = var.secret_data
  name  = var.secret_name
  dynamic "labels" {
    for_each = var.secret_labels
    content {
      label = lookup(labels.value, "label", null)
      value = lookup(labels.value, "value", null)
    }
  }
}

# -----------------------------------------------------------------------------
# DOCKER SERVICE
# -----------------------------------------------------------------------------

resource "docker_service" "this" {
  count = var.create_docker_service ? 1 : 0
  name  = var.service_name
  dynamic "task_spec" {
    for_each = var.service_task_spec
    content {
      dynamic "container_spec" {
        for_each = lookup(task_spec.value, "container_spec", [])
        content {
          image   = lookup(container_spec.value, "image", null)
          args    = lookup(container_spec.value, "args", null)
          command = lookup(container_spec.value, "command", null)
          dynamic "configs" {
            for_each = lookup(container_spec.value, "configs", [])
            content {
              config_id   = lookup(configs.value, "config_id", null)
              file_name   = lookup(configs.value, "file_name", null)
              config_name = lookup(configs.value, "config_name", null)
              file_gid    = lookup(configs.value, "file_gid", null)
              file_mode   = lookup(configs.value, "file_mode", null)
              file_uid    = lookup(configs.value, "file_uid", null)
            }
          }
          dir = lookup(container_spec.value, "dir", null)
          dynamic "dns_config" {
            for_each = lookup(container_spec.value, "dns_config", [])
            content {
              nameservers = lookup(dns_config.value, "nameservers", null)
              options     = lookup(dns_config.value, "options", null)
              search      = lookup(dns_config.value, "search", null)
            }
          }
          env    = lookup(container_spec.value, "env", null)
          groups = lookup(container_spec.value, "groups", null)
          dynamic "healthcheck" {
            for_each = lookup(container_spec.value, "healthcheck", [])
            content {
              test         = lookup(healthcheck.value, "test", null)
              interval     = lookup(healthcheck.value, "interval", null)
              retries      = lookup(healthcheck.value, "retries", null)
              start_period = lookup(healthcheck.value, "start_period", null)
              timeout      = lookup(healthcheck.value, "timeout", null)
            }
          }
          hostname = lookup(container_spec.value, "hostname", null)
          dynamic "hosts" {
            for_each = lookup(container_spec.value, "hosts", [])
            content {
              host = lookup(hosts.value, "host", null)
              ip   = lookup(hosts.value, "ip", null)
            }
          }
          isolation = lookup(container_spec.value, "isolation", null)
          dynamic "labels" {
            for_each = lookup(container_spec.value, "labels", [])
            content {
              label = lookup(labels.value, "label", null)
              value = lookup(labels.value, "value", null)
            }
          }
          dynamic "mounts" {
            for_each = lookup(container_spec.value, "mounts", [])
            content {
              target = lookup(mounts.value, "target", null)
              type   = lookup(mounts.value, "type", null)
              dynamic "bind_options" {
                for_each = lookup(mounts.value, "bind_options", [])
                content {
                  propagation = lookup(bind_options.value, "propagation", null)
                }
              }
              read_only = lookup(mounts.value, "read_only", null)
              source    = lookup(mounts.value, "source", null)
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
                  driver_name    = lookup(volume_options, "driver_name", null)
                  driver_options = lookup(volume_options, "driver_options", null)
                  dynamic "labels" {
                    for_each = lookup(volume_options.value, "labels", [])
                    content {
                      label = lookup(labels.value, "label", null)
                      value = lookup(labels.value, "value", null)
                    }
                  }
                  no_copy = lookup(volume_options.value, "no_copy", null)
                }
              }
            }
          }
          dynamic "privileges" {
            for_each = lookup(container_spec.value, "privileges", [])
            content {
              dynamic "credential_spec" {
                for_each = lookup(privileges.value, "credential_spec", [])
                content {
                  file     = lookup(credential_spec.value, "file", null)
                  registry = lookup(credential_spec.value, "registry", null)
                }
              }
              dynamic "se_linux_context" {
                for_each = lookup(privileges.value, "se_linux_context", [])
                content {
                  disable = lookup(se_linux_context.value, "disable", null)
                  level   = lookup(se_linux_context.value, "level", null)
                  role    = lookup(se_linux_context.value, "role", null)
                  type    = lookup(se_linux_context.value, "type", null)
                  user    = lookup(se_linux_context.value, "user", null)
                }
              }
            }
          }
          read_only = lookup(container_spec.value, "read_only", null)
          dynamic "secrets" {
            for_each = lookup(container_spec.value, "secrets", [])
            content {
              file_name = lookup(secrets.value, "file_name", null)
              secret_id = lookup(secrets.value, "secret_id", null)
              file_gid  = lookup(secrets.value, "file_gid", null)
              file_mode = lookup(secrets.value, "file_mode", null)
              file_uid  = lookup(secrets.value, "file_uid", null)
              # secret_name = "" The config in the reference will be identified by its ID
            }
          }
          stop_grace_period = lookup(container_spec.value, "stop_grace_period", null)
          stop_signal       = lookup(container_spec.value, "stop_signal", null)
          user              = lookup(container_spec.value, "user", null)
        }
      }
      force_update = lookup(task_spec.value, "force_update", null)
      dynamic "log_driver" {
        for_each = lookup(task_spec.value, "log_driver", [])
        content {
          name    = lookup(log_driver.value, "name", null)
          options = lookup(log_driver.value, "options", null)
        }
      }
      networks = lookup(task_spec.value, "networks", null)
      dynamic "placement" {
        for_each = lookup(task_spec.value, "placement", [])
        content {
          constraints  = lookup(placement.value, "constraints", null)
          max_replicas = lookup(placement.value, "max_replicas", null)
          dynamic "platforms" {
            for_each = lookup(placement.value, "platforms", [])
            content {
              architecture = lookup(platforms.value, "architecture", null)
              os           = lookup(platforms.value, "os", null)
            }
          }
          prefs = lookup(placement.value, "prefs", null)
        }
      }
      dynamic "resources" {
        for_each = lookup(task_spec.value, "resources", [])
        content {
          dynamic "limits" {
            for_each = lookup(resources.value, "limits", [])
            content {
              memory_bytes = lookup(limits.value, "memory_bytes", null)
              nano_cpus    = lookup(limits.value, "nano_cpus", null)
            }
          }
          dynamic "reservation" {
            for_each = lookup(resources.value, "reservation", [])
            content {
              dynamic "generic_resources" {
                for_each = lookup(reservation.value, "generic_resources", [])
                content {
                  discrete_resources_spec = lookup(generic_resources.value, "discrete_resources_spec", null)
                  named_resources_spec    = lookup(generic_resources.value, "named_resources_spec", null)
                }
              }
              memory_bytes = lookup(reservation.value, "memory_bytes", null)
              nano_cpus    = lookup(reservation.value, "nano_cpus", null)
            }
          }
        }
      }
      dynamic "restart_policy" {
        for_each = lookup(task_spec.value, "restart_policy", [])
        content {
          condition    = lookup(restart_policy.value, "condition", null)
          delay        = lookup(restart_policy.value, "delay", null)
          max_attempts = lookup(restart_policy.value, "max_attempts", null)
          window       = lookup(restart_policy.value, "window", null)
        }
      }
      runtime = lookup(task_spec.value, "runtime", null)
    }
  }
  dynamic "auth" {
    for_each = var.service_auth
    content {
      server_address = lookup(auth.value, "server_address", null)
      password       = lookup(auth.value, "password", null)
      username       = lookup(auth.value, "username", null)
    }
  }
  dynamic "converge_config" {
    for_each = var.service_converge_config
    content {
      delay   = lookup(converge_config.value, "delay", null)
      timeout = lookup(converge_config.value, "timeout", null)
    }
  }
  dynamic "endpoint_spec" {
    for_each = var.service_endpoint_spec
    content {
      mode = lookup(endpoint_spec.value, "mode", null)
      dynamic "ports" {
        for_each = lookup(endpoint_spec.value, "ports", [])
        content {
          target_port    = lookup(ports.value, "target_port", null)
          name           = lookup(ports.value, "name", null)
          protocol       = lookup(ports.value, "protocol", null)
          publish_mode   = lookup(ports.value, "publish_mode", null)
          published_port = lookup(ports.value, "published_port", null)
        }
      }
    }
  }
  dynamic "labels" {
    for_each = var.service_labels
    content {
      label = lookup(labels.value, "label", null)
      value = lookup(labels.value, "value", null)
    }
  }
  dynamic "mode" {
    for_each = var.service_mode
    content {
      global = lookup(mode.value, "global", null)
      dynamic "replicated" {
        for_each = lookup(mode.value, "replicated", [])
        content {
          replicas = lookup(replicated.value, "replicas", null)
        }
      }
    }
  }
  dynamic "rollback_config" {
    for_each = var.service_rollback_config
    content {
      delay             = lookup(rollback_config.value, "delay", null)
      failure_action    = lookup(rollback_config.value, "failure_action", null)
      max_failure_ratio = lookup(rollback_config.value, "max_failure_ratio", null)
      monitor           = lookup(rollback_config.value, "monitor", null)
      order             = lookup(rollback_config.value, "order", null)
      parallelism       = lookup(rollback_config.value, "parallelism", null)
    }
  }
  dynamic "update_config" {
    for_each = var.service_update_config
    content {
      delay             = lookup(update_config.value, "delay", null)
      failure_action    = lookup(update_config.value, "failure_action", null)
      max_failure_ratio = lookup(update_config.value, "max_failure_ratio", null)
      monitor           = lookup(update_config.value, "monitor", null)
      order             = lookup(update_config.value, "order", null)
      parallelism       = lookup(update_config.value, "parallelism", null)
    }
  }
}

# -----------------------------------------------------------------------------
# DOCKER VOLUME
# -----------------------------------------------------------------------------

resource "docker_volume" "this" {
  count       = var.create_docker_volume ? 1 : 0
  driver      = var.volume_driver
  driver_opts = var.volume_driver_opts
  dynamic "labels" {
    for_each = var.volume_labels
    content {
      label = lookup(labels.value, "label", null)
      value = lookup(labels.value, "value", null)
    }
  }
  name = var.volume_name
}
