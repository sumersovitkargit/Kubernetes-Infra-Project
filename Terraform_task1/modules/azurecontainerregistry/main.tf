resource "azurerm_container_registry" "container_registry" {
    name = "mapup${var.region}${var.env}"
    resource_group_name = var.rg_name
    location = var.azure_region
    sku = "Basic" #Need Premium for actal deployment
    admin_enabled = true
}