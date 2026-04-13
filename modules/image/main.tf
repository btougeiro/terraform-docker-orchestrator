# -----------------------------------------------------------------------------
# DOCKER IMAGE SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_image" "this" {
  for_each = var.images

  name = each.value.name

  dynamic "build" {
    for_each = lookup(each.value, "build", [])
    content {
      context      = lookup(build.value, "context", ".")
      build_args   = lookup(build.value, "build_args", null)
      dockerfile   = lookup(build.value, "dockerfile", null)
      force_remove = lookup(build.value, "force_remove", null)
      label        = lookup(build.value, "label", null)
      no_cache     = lookup(build.value, "no_cache", null)
      remove       = lookup(build.value, "remove", null)
      tag          = lookup(build.value, "tag", null)
      target       = lookup(build.value, "target", null)
    }
  }

  force_remove  = lookup(each.value, "force_remove", null)
  keep_locally  = lookup(each.value, "keep_locally", null)
  pull_triggers = lookup(each.value, "pull_triggers", [])
}
