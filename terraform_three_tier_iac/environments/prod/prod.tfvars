# terraform tfvars file for the production environment
# Database configuration
resource_group_name = "prod-rg"
location = "East US"
prefix = "prod"
db_admin_username = "prodadmin"
db_admin_password = "ProdP@ssw0rd1234"
db_server_name = "prod-db-server"
db_name = "prod-db"
db_version = "13"
db_sku_name = "GP_Standard_D2s_v3"
storage_mb = 32768
backup_retention_days = 7
subnet_id = "/subscriptions/your-subscription-id/resourceGroups/prod-rg/providers/Microsoft.Network/virtualNetworks/prod-vnet/subnets/db-subnet"
# Network configuration
# Private and service endpoints can be configured
