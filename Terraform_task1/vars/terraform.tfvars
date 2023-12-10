
#commit5
# Common
region = "jp"
azure_region = "japaneast"
env = "mapupassesment"
tenant_id = "ab968060-1bea-4e12-ba68-c8579dd00e75"
resource Owner = "sumer"

# tags



# Log Analytics Workspce
#workspace_name = "log-${var.region}-${var.env}" 
#resource_group_name = "myResourceGroup"

# VNET and Redis cache
address_space = ["192.168.10.0/24"]
subnets = [
  { name = "aks_subnet", address_prefixes = ["10.14.0.0/20"], service_endpoints = ["Microsoft.Storage"] },
  { name = "vm_subnet", address_prefixes = ["10.14.20.0/26"], service_endpoints = ["Microsoft.Storage"] },

]



# AKS
#default_node_count = "2"
#min_default_node_count = "2"
#max_default_node_count = "3"
#default_node_family = "Standard_E8as_v5"
admin_group_id = ["b6c0722a-361d-4b8a-b7f5-9e6ebf7d1235"]
dns_name       = "mapupassesment"
max_node       = 2
min_node       = 1
#vm_family = "Standard_DS2_v2"
userpool_details = [
  { name = "userpool1", node_taint = ["pool=userpool001:NoSchedule"], node_label = ["app:mapupassesment"], userpool_min_node = 1, userpool_max_node = 1, vm_family = "Standard_DS2_v2" }
  #{ name = "rmqpool", node_taint = ["pool=userpool001:NoSchedule"], node_label = ["app:rabbitmq"], userpool_min_node = 1, userpool_max_node = 1, vm_family = "Standard_DS13_v2" }
]

# VM
vm_family        = "Standard_DS2_v2"
vm_computer_name = "test"
vm_password      = "Password@2222"
vm_user          = "admin"

/*
# VNET
#vnet_name = "vnet-jp-sandbox"
address_space = ["192.168.10.0/24"]
subnet_name = "mySubnet1, mySubnet2, mySubnet3 "
subnet_prefixes = ["192.168.10.0/26, 192.168.10.64/26,192.168.10.128/26"]
*/
