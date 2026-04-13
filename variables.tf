variable "networks" {
  description = "Map of network configurations"
  type        = any
  default     = {}
}

variable "volumes" {
  description = "Map of volume configurations"
  type        = any
  default     = {}
}

variable "containers" {
  description = "Map of container configurations"
  type        = any
  default     = {}
}

variable "services" {
  description = "Map of service configurations"
  type        = any
  default     = {}
}
