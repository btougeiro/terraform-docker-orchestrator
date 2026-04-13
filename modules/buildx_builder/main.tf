# -----------------------------------------------------------------------------
# DOCKER BUILDX BUILDER SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_buildx_builder" "this" {
  for_each = var.buildx_builders

  name    = each.value.name
  driver  = lookup(each.value, "driver", null)
  enabled = lookup(each.value, "enabled", null)

  dynamic "buildkit_config" {
    for_each = lookup(each.value, "buildkit_config", [])
    content {
      config = lookup(buildkit_config.value, "config", null)
    }
  }

  dynamic "nodes" {
    for_each = lookup(each.value, "nodes", [])
    content {
      name     = lookup(nodes.value, "name", null)
      platform = lookup(nodes.value, "platform", null)
    }
  }
}
