locals {
  resource_name_prefix              = "${var.business_division}-${var.environment}"
  resource_name_prefix_alphanumeric = replace(local.resource_name_prefix, "-", "")

  database_url = "postgresql+psycopg://${var.postgres_administrator_login}:${urlencode(var.postgres_administrator_password)}@${azurerm_postgresql_flexible_server.pg.fqdn}:5432/postgres"
}