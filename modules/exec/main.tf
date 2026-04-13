# -----------------------------------------------------------------------------
# DOCKER EXEC SUB-MODULE
# -----------------------------------------------------------------------------

resource "docker_exec" "this" {
  for_each = var.execs

  container_id = each.value.container_id
  command      = each.value.command

  detach = lookup(each.value, "detach", null)
  env    = lookup(each.value, "env", null)
  tty    = lookup(each.value, "tty", null)
  user   = lookup(each.value, "user", null)
  working_dir = lookup(each.value, "working_dir", null)
}
