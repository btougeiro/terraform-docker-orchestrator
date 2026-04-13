# -----------------------------------------------------------------------------
# DOCKER NETWORK SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_network" "this" {
  for_each = var.networks

  name            = each.value.name
  attachable      = lookup(each.value, "attachable", null)
  check_duplicate = lookup(each.value, "check_duplicate", null)
  driver          = lookup(each.value, "driver", "bridge")
  ingress         = lookup(each.value, "ingress", null)
  internal        = lookup(each.value, "internal", null)
  ipam_driver     = lookup(each.value, "ipam_driver", "default")
  ipv6            = lookup(each.value, "ipv6", null)
  options         = lookup(each.value, "options", null)

  dynamic "ipam_config" {
    for_each = lookup(each.value, "ipam_config", [])
    content {
      aux_address = lookup(ipam_config.value, "aux_address", null)
      gateway     = lookup(ipam_config.value, "gateway", null)
      ip_range    = lookup(ipam_config.value, "ip_range", null)
      subnet      = lookup(ipam_config.value, "subnet", null)
    }
  }

  dynamic "labels" {
    for_each = lookup(each.value, "labels", [])
    content {
      label = lookup(labels.value, "label", null)
      value = lookup(labels.value, "value", null)
    }
  }
}
