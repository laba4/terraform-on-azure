resource "azurerm_resource_group" "rg" {
  name     = "${local.resource_name_prefix}-rg-${random_string.myrandom.id}"
  location = var.resource_group_location
}