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
    location = var.location
    resource_group_name = var.rg
    ip_address_type = "Public"
    dns_name_label = "cdillon-bpcalc-staging"
    os_type = "Linux"
    
    exposed_port = [
        {
            port     = 8081,
            protocol = "TCP"
        },
        {
            port     = 443,
            protocol = "TCP"
        }
    ]
    container {
        name = "bpcalculator-staging"
        image = "cdillonacipoc.azurecr.io/bpcalculator-staging:latest"
        cpu = "0.5"
        memory = "0.5"
    
    ports {
        port = 8081
        protocol = "TCP"
    }
    }

    container {
        name = "caddy-stg"
        image = "caddy"
        memory = "0.5"
        cpu = "0.5"
    
    ports {
        port = 443
        protocol = "TCP"
    }

    volume {
        name = "aci-caddy-data"
        mount_path = "/data"
        storage_account_name = azurerm_storage_account.caddy-stg.name
        storage_account_key = azurerm_storage_account.caddy-stg.primary_access_key
        share_name = azurerm_storage_share.aci_caddy.name
    }

    commands = ["caddy", "reverse-proxy", "--from", "cdillon-bpcalc-staging.northeurope.azurecontainer.io", "--to", "localhost:8081"]
    }
}