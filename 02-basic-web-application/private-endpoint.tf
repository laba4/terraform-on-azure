resource "azurerm_private_dns_zone" "postgres" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "postgres" {
  name                = "pdnslink-postgres-${local.resource_name_prefix}"
  private_dns_zone_id = azurerm_private_dns_zone.postgres.id
  virtual_network_id  = azurerm_virtual_network.vnet.id
}

resource "azurerm_private_endpoint" "postgres" {
  name                = "pep-postgres-${local.resource_name_prefix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_id           = azurerm_subnet.database_subnet.id

  private_service_connection {
    name                           = "psc-postgres-${local.resource_name_prefix}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_postgresql_flexible_server.pg.id
    subresource_names              = ["postgresqlServer"]
  }

  private_dns_zone_group {
    name                 = "pdzg-postgres-${local.resource_name_prefix}"
    private_dns_zone_ids = [azurerm_private_dns_zone.postgres.id]
  }
}