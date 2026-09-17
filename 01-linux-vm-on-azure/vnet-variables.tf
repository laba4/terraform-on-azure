variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "vm_subnet_address_prefixes" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "bastion_subnet_address_prefixes" {
  type    = list(string)
  default = ["10.0.100.0/24"]
}