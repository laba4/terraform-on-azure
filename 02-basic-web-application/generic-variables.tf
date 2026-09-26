variable "business_division" {
  type = string
}

variable "environment" {
  type = string
}

variable "resource_group_location" {
  type    = string
  default = "switzerlandnorth"
}

variable "container_image" {
  type        = string
  description = "Image and tag to run, e.g. \"heroes-api:v1\""
}

variable "postgres_administrator_login" {
  type        = string
  description = "Administrator username for the Postgres Flexible Server"
  default     = "psqladmin"
}

variable "postgres_administrator_password" {
  type        = string
  description = "Administrator password for the Postgres Flexible Server"
  sensitive   = true
}