resource "azurerm_postgresql_flexible_server" "pg" {
  name                = "pgsql-${local.resource_name_prefix}-${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  version  = "16"
  sku_name = "B_Standard_B1ms"

  storage_mb = 32768

  administrator_login    = var.postgres_administrator_login
  administrator_password = var.postgres_administrator_password

  public_network_access_enabled = false

  lifecycle {
    ignore_changes = [zone]
  }
}