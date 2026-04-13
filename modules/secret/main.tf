# -----------------------------------------------------------------------------
# DOCKER SECRET SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_secret" "this" {
  for_each = var.secrets

  data = each.value.data
  name = each.value.name

  dynamic "labels" {
    for_each = lookup(each.value, "labels", [])
    content {
      label = lookup(labels.value, "label", null)
      value = lookup(labels.value, "value", null)
    }
  }
}
