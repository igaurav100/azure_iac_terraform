module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = "${var.prefix}-vnet"
}

module "database" {
  source              = "./modules/database"
  resource_group_name = var.resource_group_name
  location            = var.location
  db_server_name      = "${var.prefix}-db-server"
  db_name             = "${var.prefix}-db"
  db_admin_username   = var.db_admin_username
  db_admin_password   = var.db_admin_password
  subnet_id           = module.network.db_subnet_id
  private_dns_zone_id = module.network.private_dns_zone_id
}

module "app_service" {
  source              = "./modules/app_service"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_name   = "${var.prefix}-asp"
  app_name            = "${var.prefix}-app"
  subnet_id           = module.network.app_subnet_id
  app_settings = {
    "DATABASE_URL" = module.database.db_connection_string
    "WEBSITES_PORT" = "8080"
  }
}