variable "networks" {
  description = "Map of network configurations. Key is the logical name, value is the configuration object."
  type = map(object({
    name        = string
    create      = optional(bool, true)
    attachable  = optional(bool)
    driver      = optional(string, "bridge")
    ingress     = optional(bool)
    internal    = optional(bool)
    ipam_driver = optional(string, "default")
    ipv6        = optional(bool)
    options     = optional(map(string))
    ipam_config = optional(list(object({
      aux_address = optional(map(string))
      gateway     = optional(string)
      ip_range    = optional(string)
      subnet      = optional(string)
    })), [])
    labels = optional(list(object({
      label = string
      value = string
    })), [])
  }))
  default = {}

  validation {
    condition     = alltrue([for n in var.networks : contains(["bridge", "host", "none", "overlay", "macvlan", "ipvlan"], n.driver)])
    error_message = "The network driver must be one of: bridge, host, none, overlay, macvlan, ipvlan."
  }
}
