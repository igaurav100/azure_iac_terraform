output "app_id" {
  value = azurerm_linux_web_app.app.id
}

output "app_name" {
  value = azurerm_linux_web_app.app.name
}

output "app_default_hostname" {
  value = azurerm_linux_web_app.app.default_hostname
}

output "app_identity_principal_id" {
  value = try(azurerm_linux_web_app.app.identity[0].principal_id, null)
}