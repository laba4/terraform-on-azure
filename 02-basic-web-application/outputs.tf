output "container_image_reference" {
  value = "${azurerm_container_registry.acr.login_server}/${var.container_image}"
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "container_app_fqdn" {
  value = azurerm_container_app.app.latest_revision_fqdn
}

output "postgres_fqdn" {
  value = azurerm_postgresql_flexible_server.pg.fqdn
}
