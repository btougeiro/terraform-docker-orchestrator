# -----------------------------------------------------------------------------
# DOCKER VOLUME SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_volume" "this" {
  for_each = { for k, v in var.volumes : k => v if v.create }

  name        = each.value.name
  driver      = each.value.driver
  driver_opts = each.value.driver_opts

  dynamic "labels" {
    for_each = each.value.labels
    content {
      label = labels.value.label
      value = labels.value.value
    }
  }
}

# Note: The docker provider doesn't support data "docker_volume".
# For volumes, we only manage the lifecycle of volumes we create.
