resource "azurerm_container_registry" "acr" {
  name                = "cdillonacr"
  resource_group_name = var.rg
  location            = var.location
  sku                 = "Basic"
}
