resource "azurerm_container_registry" "acr" {
  name                = "cdillonacr"
  resource_group_name = var.rg
  location            = "north_europe"
  sku                 = "Basic"
}
