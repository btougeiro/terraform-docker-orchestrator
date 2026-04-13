# -----------------------------------------------------------------------------
# DOCKER CONFIG SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_config" "this" {
  for_each = var.configs

  data = each.value.data
  name = each.value.name
}
