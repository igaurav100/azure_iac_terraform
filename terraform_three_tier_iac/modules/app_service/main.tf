resource "azurerm_service_plan" "plan" {
  name                = var.service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.plan.id
  https_only          = true

  site_config {
    always_on        = var.always_on
    ftps_state       = "Disabled"
    app_command_line = var.app_command_line
    vnet_route_all_enabled = true

    application_stack {
    #   docker_image     = var.docker_image
    #   docker_image_tag = var.docker_image_tag
    node_version = "20-lts"
    }
  }

  app_settings = var.app_settings

  dynamic "identity" {
    for_each = var.identity_enabled ? [1] : []
    content {
      type = "SystemAssigned"
    }
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  app_service_id = azurerm_linux_web_app.app.id
  subnet_id      = var.subnet_id
}