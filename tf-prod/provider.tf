terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.97.1"
    }
  }
  
  backend "azurerm" {
    resource_group_name      = "aci_poc"
    storage_account_name     = "cdillonacistorage"
    container_name           = "terraform-stg"
    key                      = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
    skip_provider_registration = "true"
}
