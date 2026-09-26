variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "app_subnet_address_prefixes" {
  type    = list(string)
  default = ["10.0.0.0/23"]
}

variable "database_subnet_address_prefixes" {
  type    = list(string)
  default = ["10.0.100.0/24"]
}