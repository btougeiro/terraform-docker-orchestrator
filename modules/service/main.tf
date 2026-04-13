# -----------------------------------------------------------------------------
# DOCKER SERVICE (SWARM) SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_service" "this" {
  for_each = var.services

  name = each.value.name

  dynamic "task_spec" {
    for_each = lookup(each.value, "task_spec", [])
    content {
      dynamic "container_spec" {
        for_each = lookup(task_spec.value, "container_spec", [])
        content {
          image   = lookup(container_spec.value, "image", null)
          args    = lookup(container_spec.value, "args", null)
          command = lookup(container_spec.value, "command", null)
          dir     = lookup(container_spec.value, "dir", null)
          env     = lookup(container_spec.value, "env", null)
          groups  = lookup(container_spec.value, "groups", null)
          hostname = lookup(container_spec.value, "hostname", null)
          isolation = lookup(container_spec.value, "isolation", null)
          read_only = lookup(container_spec.value, "read_only", null)
          stop_grace_period = lookup(container_spec.value, "stop_grace_period", null)
          stop_signal       = lookup(container_spec.value, "stop_signal", null)
          user              = lookup(container_spec.value, "user", null)

          dynamic "configs" {
            for_each = lookup(container_spec.value, "configs", [])
            content {
              config_id   = lookup(configs.value, "config_id", null)
              file_name   = lookup(configs.value, "file_name", null)
              config_name = lookup(configs.value, "config_name", null)
            }
          }

          dynamic "dns_config" {
            for_each = lookup(container_spec.value, "dns_config", [])
            content {
              nameservers = lookup(dns_config.value, "nameservers", null)
              options     = lookup(dns_config.value, "options", null)
              search      = lookup(dns_config.value, "search", null)
            }
          }

          dynamic "healthcheck" {
            for_each = lookup(container_spec.value, "healthcheck", [])
            content {
              test         = lookup(healthcheck.value, "test", null)
              interval     = lookup(healthcheck.value, "interval", null)
              retries      = lookup(healthcheck.value, "retries", null)
              timeout      = lookup(healthcheck.value, "timeout", null)
            }
          }

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
              source = lookup(mounts.value, "source", null)
              read_only = lookup(mounts.value, "read_only", null)
            }
          }

          dynamic "secrets" {
            for_each = lookup(container_spec.value, "secrets", [])
            content {
              file_name = lookup(secrets.value, "file_name", null)
              secret_id = lookup(secrets.value, "secret_id", null)
            }
          }
        }
      }

      networks = lookup(task_spec.value, "networks", null)

      dynamic "restart_policy" {
        for_each = lookup(task_spec.value, "restart_policy", [])
        content {
          condition    = lookup(restart_policy.value, "condition", null)
          delay        = lookup(restart_policy.value, "delay", null)
          max_attempts = lookup(restart_policy.value, "max_attempts", null)
        }
      }
    }
  }

  dynamic "endpoint_spec" {
    for_each = lookup(each.value, "endpoint_spec", [])
    content {
      mode = lookup(endpoint_spec.value, "mode", null)
      dynamic "ports" {
        for_each = lookup(endpoint_spec.value, "ports", [])
        content {
          target_port    = lookup(ports.value, "target_port", null)
          name           = lookup(ports.value, "name", null)
          protocol       = lookup(ports.value, "protocol", "tcp")
          published_port = lookup(ports.value, "published_port", null)
        }
      }
    }
  }

  dynamic "mode" {
    for_each = lookup(each.value, "mode", [])
    content {
      global = lookup(mode.value, "global", null)
      dynamic "replicated" {
        for_each = lookup(mode.value, "replicated", [])
        content {
          replicas = lookup(replicated.value, "replicas", 1)
        }
      }
    }
  }
}
