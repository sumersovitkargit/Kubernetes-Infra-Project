resource "azurerm_resource_group" "main_rg" {
  name     = "rg-${var.region}-${var.env}"
  location = var.azure_region
  tags = var.tags
}