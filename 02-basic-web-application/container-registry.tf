resource "azurerm_container_registry" "acr" {
  name                = "cr${local.resource_name_prefix_alphanumeric}${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}