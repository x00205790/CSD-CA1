resource "azurerm_container_registry" "acr" {
  name                = "cdillonacipoc"
  resource_group_name = var.rg
  location            = "north_europe"
  sku                 = "Standard"
}

resource "azurerm_storage_share" "caddy" {
  name                 = "aci-caddy-data"
  storage_account_name = var.storage_account_name
  quota                = 1
}


