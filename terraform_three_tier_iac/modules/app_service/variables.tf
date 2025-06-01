variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "app_name" {
  description = "Name of the Web App"
  type        = string
}

variable "os_type" {
  description = "OS type (Linux or Windows)"
  type        = string
  default     = "Linux"
}

variable "sku_name" {
  description = "SKU for the App Service Plan"
  type        = string
  default     = "P1v2"
}

variable "always_on" {
  description = "Enable always on"
  type        = bool
  default     = true
}

variable "subnet_id" {
  description = "Subnet ID for VNet integration"
  type        = string
}

variable "docker_image" {
  description = "Docker image to deploy"
  type        = string
  default     = ""
}

variable "docker_image_tag" {
  description = "Docker image tag"
  type        = string
  default     = "latest"
}

variable "app_command_line" {
  description = "App command line to run"
  type        = string
  default     = ""
}

variable "app_settings" {
  description = "App settings"
  type        = map(string)
  default     = {}
}

variable "identity_enabled" {
  description = "Enable system assigned identity"
  type        = bool
  default     = true
}