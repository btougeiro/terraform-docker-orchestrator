# -----------------------------------------------------------------------------
# DOCKER NETWORK SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_network" "this" {
  for_each = { for k, v in var.networks : k => v if v.create }

  name        = each.value.name
  attachable  = each.value.attachable
  driver      = each.value.driver
  ingress     = each.value.ingress
  internal    = each.value.internal
  ipam_driver = each.value.ipam_driver
  ipv6        = each.value.ipv6
  options     = each.value.options

  dynamic "ipam_config" {
    for_each = each.value.ipam_config
    content {
      aux_address = ipam_config.value.aux_address
      gateway     = ipam_config.value.gateway
      ip_range    = ipam_config.value.ip_range
      subnet      = ipam_config.value.subnet
    }
  }

  dynamic "labels" {
    for_each = each.value.labels
    content {
      label = labels.value.label
      value = labels.value.value
    }
  }
}

data "docker_network" "this" {
  for_each = { for k, v in var.networks : k => v if !v.create }

  name = each.value.name
}
