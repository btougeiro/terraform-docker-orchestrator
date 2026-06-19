output "buildx_builders" {
  description = "A map of all buildx builder resources managed by this module."
  value       = docker_buildx_builder.this
}
