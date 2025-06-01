output "db_server_id" {
  value = azurerm_postgresql_flexible_server.db.id
}

output "db_server_fqdn" {
  value = azurerm_postgresql_flexible_server.db.fqdn
}

output "db_name" {
  value = azurerm_postgresql_flexible_server_database.db.name
}

output "db_connection_string" {
  value = "Server=${azurerm_postgresql_flexible_server.db.fqdn};Database=${azurerm_postgresql_flexible_server_database.db.name};Port=5432;User Id=${var.db_admin_username};Password=${var.db_admin_password};Ssl Mode=Require;"
  sensitive = true
}