terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.31.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  # terraform backend configuration
  features {}
  # Optional: Specify the Azure subscription ID if not set in the environment
  # subscription_id = "your-subscription-id"
  # Optional: Specify the Azure tenant ID if not set in the environment
  # tenant_id = "your-tenant-id"
  # Optional: Specify the Azure client ID if not set in the environment
  # client_id = "your-client-id"
}