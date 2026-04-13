# -----------------------------------------------------------------------------
# DOCKER TAG SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_tag" "this" {
  for_each = var.tags

  source_image = each.value.source_image
  target_image = each.value.target_image
}
