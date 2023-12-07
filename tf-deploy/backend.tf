backend "azurerm" {
    tenant_id                = var.tenant
    subscription_id          = var.subscription
    resource_group_name      = var.rg
    storage_account_name     = "acipoctf"
    container_name           = "terraform"
    key                      = "terraform.tfstate"
}
