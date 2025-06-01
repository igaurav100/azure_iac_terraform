output "app_url" {
  value = module.app_service.app_default_hostname
}

output "db_fqdn" {
  value = module.database.db_server_fqdn
}