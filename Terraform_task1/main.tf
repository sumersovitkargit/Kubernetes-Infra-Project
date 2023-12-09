module "resourcegroup" {
    source = "./modules/resourcegroup"
    region = var.region
    azure_region = var.azure_region
    env = var.env
    tags  = local.tags
}

module "storageaccount" {
  depends_on = [ module.resourcegroup ]
  source = "./modules/storageaccount"
  region = var.region
  rg_name = module.resourcegroup.resource_group_name
  azure_region = var.azure_region
  env = var.env
}


module "azurecontainerregistry" {
  source = "./modules/azurecontainerregistry"
  region = var.region
  rg_name = module.resourcegroup.resource_group_name
  azure_region = var.azure_region
  env = var.env
}
module "virtualnetwork" {
  depends_on = [module.resourcegroup]
  source     = "./modules/virtualnetwork"
  rg_name    = module.resourcegroup.resource_group_name
  region     = var.region
  #purpose    = var.purpose
  env        = var.env
  subnets    = var.subnets
  #common_tags = local.common_tags
  azure_region = var.azure_region
  tags  = local.tags
  
}


module "aks" {
  depends_on = [ module.resourcegroup, module.virtualnetwork ]
  source            = "./modules/aks"
  rg_name           = module.resourcegroup.resource_group_name
  azure_region      = var.azure_region
  env               = var.env
  region            = var.region
  aks_subnet        = lookup(module.virtualnetwork.aks_subnet, "aks_subnet")
  min_node          = var.min_node
  max_node          = var.max_node
  vm_family         = var.vm_family
  dns_name          = var.dns_name
  admin_group_id    = var.admin_group_id
  #log_analytics_id       = module.loganalyticsworkspace.log_analytics_id
  #usernode_pool     = 
  userpool_details  = var.userpool_details
  tags  = local.tags
}

module "virtualmachine" {
  depends_on             = [module.resourcegroup, module.virtualnetwork]
  source           = "./modules/virtualmachine"
  rg_name          = module.resourcegroup.resource_group_name
  region           = var.region
  azure_region     = var.azure_region
  vm_family        = var.vm_family
  vm_password      = var.vm_password
  vm_user          = var.vm_family
  vm_computer_name = var.vm_computer_name
  vm_subnet_id     = lookup(module.virtualnetwork.aks_subnet, "vm_subnet")
  env              = var.env
}
