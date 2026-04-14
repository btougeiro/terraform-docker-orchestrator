variable "volumes" {
  description = "Map of volume configurations. Key is the logical name, value is the configuration object."
  type = map(object({
    name        = string
    create      = optional(bool, true)
    driver      = optional(string, "local")
    driver_opts = optional(map(string))
    labels = optional(list(object({
      label = string
      value = string
    })), [])
  }))
  default = {}
}
