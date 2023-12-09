resource "azurerm_storage_account" "storageac" {
  name                     = "map${var.region}${var.env}v1"
  resource_group_name      = var.rg_name
  location                 = var.azure_region
  account_tier             = "Standard"
  account_replication_type = "GRS"
}