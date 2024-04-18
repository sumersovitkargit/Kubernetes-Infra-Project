

resource "azurerm_kubernetes_cluster" "azure_kubernetes_cluster" {
  name                = "aks-${var.region}-${var.env}"
  kubernetes_version  = "1.26.6"
  location            = var.azure_region
  resource_group_name = var.rg_name
  dns_prefix          = "aks-${var.region}-${var.env}"
  tags = var.tags

  key_vault_secrets_provider {
    secret_rotation_enabled  = true
    secret_rotation_interval = "2m"
  }

  default_node_pool {
    name                = "systempool"
   # node_count          = 2
    vm_size             = "Standard_DS2_v2"
    type                = "VirtualMachineScaleSets"
    vnet_subnet_id      = var.aks_subnet
    enable_auto_scaling = true  ###Need to check 
    min_count           = var.min_node
    max_count           = var.max_node
  }

  azure_active_directory_role_based_access_control {
    admin_group_object_ids = var.admin_group_id
    azure_rbac_enabled     = true
    managed                = true
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    dns_service_ip    = "10.15.0.10"
    service_cidr      = "10.15.0.0/16"
    load_balancer_sku = "standard"
  }

  role_based_access_control_enabled = true

  # oms_agent {
  #   log_analytics_workspace_id      = var.log_analytics_id
  #   msi_auth_for_monitoring_enabled = true

  # }
}

resource "azurerm_kubernetes_cluster_node_pool" "usernodepool" {
  for_each              = { for subnet in var.userpool_details : subnet.name => subnet }
  name                  = each.value.name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.azure_kubernetes_cluster.id
  vm_size               = each.value.vm_family
  mode                  = "User"
  zones                 = [1,3]
  node_count            = 2
  vnet_subnet_id        = var.aks_subnet
  orchestrator_version  = "1.26.6"
  node_taints           = each.value.node_taint
  node_labels = {
    "service" = "kubernetes"
    "env"     = var.env
  }
  tags = {
    "env"     = var.env
  }
  enable_auto_scaling = true
  min_count           = each.value.userpool_min_node
  max_count           = each.value.userpool_max_node
}
