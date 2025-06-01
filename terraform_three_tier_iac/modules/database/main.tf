resource "azurerm_postgresql_flexible_server" "db" {
  name                   = var.db_server_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = var.db_version
  administrator_login    = var.db_admin_username
  administrator_password = var.db_admin_password
  zone                   = var.zone
  storage_mb             = var.storage_mb
  sku_name               = var.db_sku_name
  backup_retention_days  = var.backup_retention_days

  dynamic "high_availability" {
    for_each = var.high_availability_enabled ? [1] : []
    content {
      mode = "ZoneRedundant"
    }
  }

  delegated_subnet_id = var.subnet_id
  private_dns_zone_id = var.private_dns_zone_id

  lifecycle {
    ignore_changes = [zone]
  }
}

resource "azurerm_postgresql_flexible_server_database" "db" {
  name      = var.db_name
  server_id = azurerm_postgresql_flexible_server.db.id
  collation = var.db_collation
  charset   = var.db_charset
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure_services" {
  name             = "allow-azure-services"
  server_id        = azurerm_postgresql_flexible_server.db.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}