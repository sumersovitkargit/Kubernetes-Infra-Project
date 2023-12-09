output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.virtual_network.id
}

output "virtual_network_name" {
  description = "Virtual Network Name"
  value = azurerm_virtual_network.virtual_network.name
}
 
output "aks_subnet" {
  description = "Subnet ID for the AKS cluster"
  value       = { for subnet in azurerm_subnet.subnets : subnet.name => subnet.id }
}