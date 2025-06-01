variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "db_server_name" {
  description = "Name of the PostgreSQL server"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "13"
}

variable "db_admin_username" {
  description = "Database admin username"
  type        = string
  sensitive   = true
}

variable "db_admin_password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}

variable "db_sku_name" {
  description = "Database SKU"
  type        = string
  default     = "GP_Standard_D2s_v3"
}

variable "storage_mb" {
  description = "Storage size in MB"
  type        = number
  default     = 32768
}

variable "backup_retention_days" {
  description = "Backup retention days"
  type        = number
  default     = 7
}

variable "subnet_id" {
  description = "Subnet ID for private access"
  type        = string
}

variable "private_dns_zone_id" {
  description = "Private DNS Zone ID"
  type        = string
}

variable "high_availability_enabled" {
  description = "Enable high availability"
  type        = bool
  default     = false
}

variable "zone" {
  description = "Availability zone"
  type        = string
  default     = "1"
}

variable "db_collation" {
  description = "Database collation"
  type        = string
  default     = "en_US.utf8"
}

variable "db_charset" {
  description = "Database charset"
  type        = string
  default     = "utf8"
}