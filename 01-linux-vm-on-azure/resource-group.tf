resource "azurerm_resource_group" "rg" {
  name     = "rg-${local.resource_name_prefix}-${random_string.suffix.result}"
  location = var.resource_group_location
}