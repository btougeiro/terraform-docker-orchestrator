output "secrets" {
  description = "A map of all Docker secret resources managed by this module."
  value       = docker_secret.this
}
