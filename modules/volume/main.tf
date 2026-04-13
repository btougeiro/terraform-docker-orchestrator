# -----------------------------------------------------------------------------
# DOCKER VOLUME SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_volume" "this" {
  for_each = var.volumes

  name        = each.value.name
  driver      = lookup(each.value, "driver", "local")
  driver_opts = lookup(each.value, "driver_opts", null)

  dynamic "labels" {
    for_each = lookup(each.value, "labels", [])
    content {
      label = lookup(labels.value, "label", null)
      value = lookup(labels.value, "value", null)
    }
  }
}
