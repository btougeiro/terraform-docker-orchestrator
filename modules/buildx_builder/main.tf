# -----------------------------------------------------------------------------
# DOCKER BUILDX BUILDER SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_buildx_builder" "this" {
  for_each = var.buildx_builders

  name            = each.value.name
  driver          = lookup(each.value, "driver", null)
  driver_options  = lookup(each.value, "driver_options", null)
  endpoint        = lookup(each.value, "endpoint", null)
  use             = lookup(each.value, "use", null)
  bootstrap       = lookup(each.value, "bootstrap", null)
  append          = lookup(each.value, "append", null)
  buildkit_config = lookup(each.value, "buildkit_config", null)
  buildkit_flags  = lookup(each.value, "buildkit_flags", null)
}
