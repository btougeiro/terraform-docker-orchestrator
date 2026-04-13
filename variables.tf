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

variable "configs" {
  description = "Map of config configurations"
  type        = any
  default     = {}
}

variable "secrets" {
  description = "Map of secret configurations"
  type        = any
  default     = {}
}

variable "images" {
  description = "Map of image configurations"
  type        = any
  default     = {}
}

variable "registry_images" {
  description = "Map of registry image configurations"
  type        = any
  default     = {}
}

variable "plugins" {
  description = "Map of plugin configurations"
  type        = any
  default     = {}
}

variable "tags" {
  description = "Map of tag configurations"
  type        = any
  default     = {}
}

variable "buildx_builders" {
  description = "Map of buildx builder configurations"
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
