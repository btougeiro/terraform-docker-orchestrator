# -----------------------------------------------------------------------------
# VARIABLES
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# DOCKER CONFIG
# -----------------------------------------------------------------------------

variable "create_docker_config" {
  type        = bool
  description = "(Required) (Boolean) Manages the configs of a Docker service in a swarm."
  default     = false
}

variable "config_name" {
  type        = string
  description = "(Required) (String) User-defined name of the config."
  default     = null
}

variable "config_data" {
  type        = string
  description = "(Required) (String) Base64-url-safe-encoded config data."
  default     = null
}

# -----------------------------------------------------------------------------
# DOCKER CONTAINER
# -----------------------------------------------------------------------------

variable "create_docker_container" {
  type        = bool
  description = "(Required) (Boolean) Manages the lifecycle of a Docker container."
  default     = false
}

variable "container_image" {
  type        = string
  description = "(Required) (String) The ID of the image to back this container. The easiest way to get this value is to use the docker_image resource."
  default     = null
}

variable "container_name" {
  type        = string
  description = "(Required) (String) The name of the container."
  default     = null
}

variable "container_attach" {
  type        = bool
  description = "(Optional) (Boolean) If true attach to the container after its creation and waits the end of its execution. Defaults to false."
  default     = false
}

variable "container_capabilities" {
  type        = list(any)
  description = "(Optional) (Block Set, Max: 1) Add or drop certain linux capabilities."
  default     = []
}

variable "container_command" {
  type        = list(string)
  description = "(Optional) (List of String) The command to use to start the container. For example, to run /usr/bin/myprogram -f baz.conf set the command to be [\"/usr/bin/myprogram\",\"-\",\"baz.con\"]."
  default     = []
}

variable "container_cpu_set" {
  type        = string
  description = "(Optional) (String) A comma-separated list or hyphen-separated range of CPUs a container can use, e.g. 0-1."
  default     = null
}

variable "container_cpu_shares" {
  type        = number
  description = "(Optional) (Number) CPU shares (relative weight) for the container."
  default     = null
}

variable "container_destroy_grace_seconds" {
  type        = number
  description = "(Optional) (Number) If defined will attempt to stop the container before destroying. Container will be destroyed after n seconds or on successful stop."
  default     = null
}

variable "container_devices" {
  type        = list(any)
  description = "(Optional) (Block Set) Bind devices to the container."
  default     = []
}

variable "container_dns" {
  type        = set(string)
  description = "(Optional) (Set of String) DNS servers to use."
  default     = []
}

variable "container_dns_opts" {
  type        = set(string)
  description = "(Optional) (Set of String) DNS options used by the DNS provider(s), see resolv.conf documentation for valid list of options."
  default     = []
}

variable "container_dns_search" {
  type        = set(string)
  description = "(Optional) (Set of String) DNS search domains that are used when bare unqualified hostnames are used inside of the container."
  default     = []
}

variable "container_domainname" {
  type        = string
  description = "(Optional) (String) Domain name of the container."
  default     = null
}

variable "container_entrypoint" {
  type        = list(string)
  description = "(Optional) (List of String) The command to use as the Entrypoint for the container. The Entrypoint allows you to configure a container to run as an executable. For example, to run /usr/bin/myprogram when starting a container, set the entrypoint to be \"/usr/bin/myprogra\"]."
  default     = []
}

variable "container_env" {
  type        = set(string)
  description = "(Optional) (Set of String) Environment variables to set in the form of KEY=VALUE, e.g. DEBUG=0."
  default     = []
}

variable "container_group_add" {
  type        = set(string)
  description = "(Optional) (Set of String) Additional groups for the container user."
  default     = []
}

variable "container_healthcheck" {
  type        = list(any)
  description = "(Optional) (Block List, Max: 1) A test to perform to check that the container is healthy."
  default     = []
}

variable "container_host" {
  type        = list(any)
  description = "(Optional) (Block Set) Additional hosts to add to the container."
  default     = []
}

variable "container_hostname" {
  type        = string
  description = "(Optional) (String) Hostname of the container."
  default     = null
}

variable "container_init" {
  type        = bool
  description = "(Optional) (Boolean) Configured whether an init process should be injected for this container. If unset this will default to the dockerd defaults."
  default     = false
}

variable "container_ipc_mode" {
  type        = string
  description = "(Optional) (String) IPC sharing mode for the container. Possible values are: none, private, shareable, container:<name|id> or host."
  default     = null
}

variable "container_labels" {
  type        = list(any)
  description = "(Optional) (Block Set) User-defined key/value metadata."
  default     = []
}

variable "container_log_driver" {
  type        = string
  description = "(Optional) (String) The logging driver to use for the container."
  default     = null
}

variable "container_log_opts" {
  type        = map(string)
  description = "(Optional) (Map of String) Key/value pairs to use as options for the logging driver."
  default     = {}
}

variable "container_logs" {
  type        = bool
  description = "(Optional) (Boolean) Save the container logs (attach must be enabled). Defaults to false."
  default     = false
}

variable "container_max_retry_count" {
  type        = number
  description = "(Optional) (Number) The maximum amount of times to an attempt a restart when restart is set to 'on-failure'."
  default     = null
}

variable "container_memory" {
  type        = number
  description = "(Optional) (Number) The memory limit for the container in MBs."
  default     = null
}

variable "container_memory_swap" {
  type        = number
  description = "(Optional) (Number) The total memory limit (memory + swap) for the container in MBs. This setting may compute to -1 after terraform apply if the target host doesn't support memory swap, when that is the case docker will use a soft limitation."
  default     = null
}

variable "container_mounts" {
  type        = list(any)
  description = "(Optional) (Block Set) Specification for mounts to be added to containers created as part of the service."
  default     = []
}

variable "container_must_run" {
  type        = bool
  description = "(Optional) (Boolean) If true, then the Docker container will be kept running. If false, then as long as the container exists, Terraform assumes it is successful. Defaults to true."
  default     = true
}

variable "container_network_mode" {
  type        = string
  description = "(Optional) (String) Network mode of the container."
  default     = null
}

variable "container_networks" {
  type        = string
  description = "(Optional) (Set of String, Deprecated) ID of the networks in which the container is."
  default     = null
}

variable "container_networks_advanced" {
  type        = list(any)
  description = "(Optional) (Block Set) The networks the container is attached to."
  default     = []
}
variable "container_pid_mode" {
  type        = string
  description = "(Optional) (String) he PID (Process) Namespace mode for the container. Either container:<name|id> or host."
  default     = null
}

variable "container_ports" {
  type        = list(any)
  description = "(Optional) (Block List) Publish a container's port(s) to the host."
  default     = []
}

variable "container_privileged" {
  type        = bool
  description = "(Optional) (Boolean) If true, the container runs in privileged mode."
  default     = false
}

variable "container_publish_all_ports" {
  type        = bool
  description = "(Optional) (Boolean) Publish all ports of the container."
  default     = true
}

variable "container_read_only" {
  type        = bool
  description = "(Optional) (Boolean) If true, the container will be started as readonly. Defaults to false."
  default     = false
}

variable "container_remove_volumes" {
  type        = bool
  description = "(Optional) (Boolean) If true, it will remove anonymous volumes associated with the container. Defaults to true."
  default     = true
}

variable "container_restart" {
  type        = string
  description = "(Optional) (String) The restart policy for the container. Must be one of 'no', 'on-failure', 'always', 'unless-stopped'. Defaults to no."
  default     = "no"
}

variable "container_rm" {
  type        = bool
  description = "(Optional) (Boolean) If true, then the container will be automatically removed when it exits. Defaults to false."
  default     = false
}

variable "container_security_opts" {
  type        = set(string)
  description = "(Optional) (Set of String) List of string values to customize labels for MLS systems, such as SELinux. See https://docs.docker.com/engine/reference/run/#security-configuration."
  default     = []
}

variable "container_shm_size" {
  type        = number
  description = "(Optional) (Number) Size of /dev/shm in MBs."
  default     = null
}

variable "container_start" {
  type        = bool
  description = "(Optional) (Boolean) If true, then the Docker container will be started after creation. If false, then the container is only created. Defaults to true."
  default     = true
}

variable "container_stdin_open" {
  type        = bool
  description = "(Optional) (Boolean) If true, keep STDIN open even if not attached (docker run -i). Defaults to false."
  default     = false
}

variable "container_storage_opts" {
  type        = map(string)
  description = "(Optional) (Map of String) Key/value pairs for the storage driver options, e.g. size: 120G."
  default     = {}
}

variable "container_sysctls" {
  type        = map(string)
  description = "(Optional) (Map of String) A map of kernel parameters (sysctls) to set in the container."
  default     = {}
}

variable "container_tmpfs" {
  type        = map(string)
  description = "(Optional) (Map of String) A map of container directories which should be replaced by tmpfs mounts, and their corresponding mount options."
  default     = {}
}

variable "container_tty" {
  type        = bool
  description = "(Optional) (Boolean) If true, allocate a pseudo-tty (docker run -t). Defaults to false."
  default     = false
}

variable "container_ulimit" {
  type        = list(any)
  description = "(Optional) (Block Set) Ulimit options to add."
  default     = []
}

variable "container_upload" {
  type        = list(any)
  description = "(Optional) (Block Set) Specifies files to upload to the container before starting it. Only one of content or content_base64 can be set and at least one of them has to be set."
  default     = []
}

variable "container_user" {
  type        = string
  description = "(Optional) (String) User used for run the first process. Format is user or user:group which user and group can be passed literraly or by name."
  default     = null
}

variable "container_userns_mode" {
  type        = string
  description = "(Optional) (String) Sets the usernamespace mode for the container when usernamespace remapping option is enabled."
  default     = null
}

variable "container_volumes" {
  type        = list(any)
  description = "(Optional) (Block Set) Spec for mounting volumes in the container."
  default     = []
}

variable "container_working_dir" {
  type        = string
  description = "(Optional) (String) The working directory for commands to run in."
  default     = null
}

# -----------------------------------------------------------------------------
# DOCKER IMAGE
# -----------------------------------------------------------------------------

variable "image_pull" {
  type        = bool
  description = "(Required) (Boolean) Pulls a Docker image to a given Docker host from a Docker Registry. This resource will not pull new layers of the image automatically unless used in conjunction with docker_registry_image data source to update the pull_triggers field."
  default     = false
}

variable "image_name" {
  type        = string
  description = "(Required) (String) The name of the Docker image, including any tags or SHA256 repo digests."
  default     = null
}

variable "build" {
  type        = list(any)
  description = "(Optional) (Block Set, Max: 1) Configuration to build an image. Please see docker build command reference too."
  default     = []
}

variable "image_force_remove" {
  type        = bool
  description = "(Optional) (Boolean) If true, then the image is removed forcibly when the resource is destroyed."
  default     = false
}

variable "image_keep_locally" {
  type        = bool
  description = "(Optional) (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation."
  default     = false
}

variable "image_pull_triggers" {
  type        = set(string)
  description = "(Optional) (Set of String) List of values which cause an image pull when changed. This is used to store the image digest from the registry when using the docker_registry_image."
  default     = []
}

# -----------------------------------------------------------------------------
# DOCKER NETWORK
# -----------------------------------------------------------------------------

variable "create_docker_network" {
  type        = bool
  description = "(Required) (Boolean) Manages the configs of a docker_network and provides details about a specific Docker Network."
  default     = false
}

variable "network_name" {
  type        = string
  description = "(Required) (String) The name of the Docker network."
  default     = null
}

variable "network_attachable" {
  type        = bool
  description = "(Optional) (Boolean) Enable manual container attachment to the network."
  default     = false
}

variable "network_check_duplicate" {
  type        = bool
  description = "(Optional) (Boolean) Requests daemon to check for networks with same name."
  default     = false
}

variable "network_driver" {
  type        = string
  description = "(Optional) (String) The driver of the Docker network. Possible values are bridge, host, overlay, macvlan. See network docs for more details."
  default     = null
}

variable "network_ingress" {
  type        = bool
  description = "(Optional) (Boolean) Create swarm routing-mesh network. Defaults to false."
  default     = false
}

variable "network_internal" {
  type        = bool
  description = "(Optional) (Boolean) Whether the network is internal."
  default     = false
}

variable "network_ipam_config" {
  type        = list(any)
  description = "(Optional) (Block Set) The IPAM configuration options."
  default     = []
}

variable "network_ipam_driver" {
  type        = string
  description = "(Optional) (String) Driver used by the custom IP scheme of the network. Defaults to default."
  default     = "default"
}

variable "network_ipv6" {
  type        = bool
  description = "(Optional) (Boolean) Enable IPv6 networking. Defaults to false."
  default     = false
}

variable "network_labels" {
  type        = list(any)
  description = "(Optional) (Block Set) User-defined key/value metadata."
  default     = []
}

variable "network_options" {
  type        = map(string)
  description = "(Optional) (Map of String) Only available with bridge networks. See bridge options docs for more details."
  default     = {}
}

# -----------------------------------------------------------------------------
# DOCKER PLUGIN
# -----------------------------------------------------------------------------

variable "create_docker_plugin" {
  type        = bool
  description = "(Required) (Boolean) Manages the lifecycle of a Docker plugin."
  default     = false
}

variable "plugin_name" {
  type        = string
  description = "(Required) (String) Docker Plugin name."
  default     = null
}

variable "plugin_alias" {
  type        = string
  description = "(Optional) (String) Docker Plugin alias."
  default     = null
}

variable "plugin_enable_timeout" {
  type        = number
  description = "(Optional) (Number) HTTP client timeout to enable the plugin."
  default     = null
}

variable "plugin_enabled" {
  type        = bool
  description = "(Optional) (Boolean) If true the plugin is enabled. Defaults to true."
  default     = true
}

variable "plugin_env" {
  type        = set(string)
  description = "(Optional) (Set of String) The environment variables in the form of KEY=VALUE, e.g. DEBUG=0."
  default     = []
}

variable "plugin_force_destroy" {
  type        = bool
  description = "(Optional) (Boolean) If true, then the plugin is destroyed forcibly."
  default     = false
}

variable "plugin_force_disable" {
  type        = bool
  description = "(Optional) (Boolean) If true, then the plugin is disabled forcibly."
  default     = false
}

variable "plugin_grant_all_permissions" {
  type        = bool
  description = "(Optional) (Boolean) If true, grant all permissions necessary to run the plugin."
  default     = false
}

variable "plugin_grant_permissions" {
  type        = list(any)
  description = "(Optional) (Block Set) Grant specific permissions only."
  default     = []
}

# -----------------------------------------------------------------------------
# DOCKER REGISTRY IMAGE
# -----------------------------------------------------------------------------

variable "create_registry_image" {
  type        = bool
  description = "(Required) (Boolean) Manages the lifecycle of docker image/tag in a registry means it can store one or more version of specific docker images and identified by their tags."
  default     = false
}

variable "registry_image_name" {
  type        = string
  description = "(Required) (String) The name of the Docker image."
  default     = null
}

variable "registry_image_build" {
  type        = list(any)
  description = "(Optional) (Block List, Max: 1) Definition for building the image."
  default     = []
}

variable "registry_image_insecure_skip_verify" {
  type        = bool
  description = "(Optional) (Boolean) If true, the verification of TLS certificates of the server/registry is disabled. Defaults to false"
  default     = false
}

variable "registry_image_keep_remotely" {
  type        = bool
  description = "(Optional) (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker registry on destroy operation. Defaults to false"
  default     = false
}

# -----------------------------------------------------------------------------
# DOCKER SECRET
# -----------------------------------------------------------------------------

variable "create_docker_secret" {
  type        = bool
  description = "(Required) (Boolean) Manages the secrets of a Docker service in a swarm."
  default     = false
}

variable "secret_data" {
  type        = string
  description = "(Required) (String, Sensitive) Base64-url-safe-encoded secret data."
  default     = null
}

variable "secret_name" {
  type        = string
  description = "(Required) (String) User-defined name of the secret."
  default     = null
}

variable "secret_labels" {
  type        = list(any)
  description = "(Optional) (Block Set) User-defined key/value metadata."
  default     = []
}

# -----------------------------------------------------------------------------
# DOCKER SERVICE
# -----------------------------------------------------------------------------

variable "create_docker_service" {
  type        = bool
  description = "(Required) (Boolean) This resource manages the lifecycle of a Docker service. By default, the creation, update and delete of services are detached. With the Converge Config the behavior of the docker cli is imitated to guarantee tha for example, all tasks of a service are running or successfully updated or to inform terraform that a service could no be updated and was successfully rolled back."
  default     = false
}

variable "service_name" {
  type        = string
  description = "(Required) (String) Name of the service."
  default     = null
}

variable "service_task_spec" {
  type        = list(any)
  description = "(Required) (Block List, Min: 1, Max: 1) User modifiable task configuration."
  default     = []
}

variable "service_auth" {
  type        = list(any)
  description = "(Optional) (Block List, Max: 1) Configuration for the authentication for pulling the images of the service."
  default     = []
}

variable "service_converge_config" {
  type        = list(any)
  description = "(Optional) (Block List, Max: 1) A configuration to ensure that a service converges aka reaches the desired that of all task up and running."
  default     = []
}

variable "service_endpoint_spec" {
  type        = list(any)
  description = "(Optional) (Block List, Max: 1) Properties that can be configured to access and load balance a service."
  default     = []
}

variable "service_labels" {
  type        = list(any)
  description = "(Optional) (Block Set) User-defined key/value metadata."
  default     = []
}

variable "service_mode" {
  type        = list(any)
  description = "(Optional) (Block List, Max: 1) Scheduling mode for the service."
  default     = null
}

variable "service_rollback_config" {
  type        = list(any)
  description = "(Optional) (Block List, Max: 1) Specification for the rollback strategy of the service."
  default     = []
}

variable "service_update_config" {
  type        = list(any)
  description = "(Optional) (Block List, Max: 1) Specification for the update strategy of the service."
  default     = []
}

# -----------------------------------------------------------------------------
# DOCKER VOLUME
# -----------------------------------------------------------------------------

variable "create_docker_volume" {
  type        = bool
  description = "(Required) (Boolean) Creates and destroys a volume in Docker. This can be used alongside docker_container to prepare volumes that can be shared across containers."
  default     = false
}

variable "volume_driver" {
  type        = string
  description = "(Optional) (String) Driver type for the volume. Defaults to local."
  default     = "local"
}

variable "volume_driver_opts" {
  type        = map(string)
  description = "(Optional) (Map of String) Options specific to the driver."
  default     = {}
}

variable "volume_labels" {
  type        = list(any)
  description = "(Optional) (Block Set) User-defined key/value metadata."
  default     = []
}

variable "volume_name" {
  type        = string
  description = "(Optional) (String) The name of the Docker volume (will be generated if not provided)."
  default     = null
}
