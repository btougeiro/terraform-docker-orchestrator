# -----------------------------------------------------------------------------
# DOCKER PLUGIN SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_plugin" "this" {
  for_each = var.plugins

  name                  = each.value.name
  alias                 = lookup(each.value, "alias", null)
  enable_timeout        = lookup(each.value, "enable_timeout", null)
  enabled               = lookup(each.value, "enabled", null)
  env                   = lookup(each.value, "env", null)
  force_destroy         = lookup(each.value, "force_destroy", null)
  force_disable         = lookup(each.value, "force_disable", null)
  grant_all_permissions = lookup(each.value, "grant_all_permissions", null)

  dynamic "grant_permissions" {
    for_each = lookup(each.value, "grant_permissions", [])
    content {
      name  = lookup(grant_permissions.value, "name", null)
      value = lookup(grant_permissions.value, "value", null)
    }
  }
}
