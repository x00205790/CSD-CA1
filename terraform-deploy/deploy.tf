resource "azurerm_container_registry" "acr" {
  name                = "cdillonacipoc"
  resource_group_name = var.rg
  location            = "north_europe"
  sku                 = "Standard"
  admin_enabled       = false  
}

