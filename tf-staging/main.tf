resource "azurerm_storage_account" "caddy-stg" {
    name = "acicaddytf"
    resource_group_name = var.rg 
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    enable_https_traffic_only = true
}

resource "azurerm_storage_share" "aci_caddy" {
    name = "aci-staging-data"
    storage_account_name = azurerm_storage_account.caddy-stg.name
    quota = 1
}

resource "azurerm_container_group" "bpcalc_stg" {
    name = "bpcalc-staging"
    location = var.rg
    ip_address_type = "Public"
    dns_name_label = "cdillon-bpcalc-staging"
    os_type = "Linux"

    container {
        name = "bpcalculator-staging"
    }
}