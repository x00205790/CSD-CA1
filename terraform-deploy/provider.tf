terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
  
  backend "azurerm" {
    tenant_id                = var.tenant
    subscription_id          = var.subscription_id
    resource_group_name      = var.rg
    storage_account_name     = var.storage_account_name
    container_name           = var.storage_container
    key                      = "terraform.tfstate"
  }

provider "azurerm" {
  features {}
    skip_provider_registration = "true"
}

}
