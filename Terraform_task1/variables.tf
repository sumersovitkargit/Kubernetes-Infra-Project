# Common variables needed for Azure resources
variable "region" {
    description = "Location of resources"
    type = string
}

variable "azure_region" {
    description = "Azure location"
    type = string
}

variable "env" {
  description = "Environment name"
}

# Common variables needed for Azure tags
#variable "resource_owner" {
#  description = "Business unit name"
#  type = string
#}

# variable "team" {
#   description = "Cost center"
#   type = string
# }

# variable "mapUp_Assesment" {
#   description = "mapUp-Assesment"
#   type = string
# }

# Variables needed for Log Analytics Workspace
variable "workspace_sku" { 
description = "SKU of the Log Analytics Workspace" 
type = string
default = "PerGB2018"
}


/*variable "workspace_name" { 
description = "Name of the Log Analytics Workspace" 
type = string 
}*/

# Variables needed for Key Vault
variable "tenant_id" {
    description = "Tenant ID"
    type = string
}

# variable "sandbox_envs" {
#   description = "List of the workspaces names"
#   type        = list(any)
# }

variable "admin_group_id" {
  description = "AKS cluster Group object ID"
  type        = list(any)
}

# Variables needed for Redis Cache




# Variables needed for Vnet
variable "subnets" {
  type = list(any)
  description = "List of objects that represent the configuration of each subnet."
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used in the virtual network"
  default     = ["10.12.0.0/16"]
}



variable "min_node" {
  description = "Minimum nodes"
}

variable "max_node" {
  description = "Maximum number of nodes"
}



variable "dns_name" {
  description = "common name"
}



variable "usernode_pool" {
  description = "list of the usernode pool"
  type        = list(any)
  default     = ["userpool1", "userpool2"]
}

variable "userpool_details" {
  type = list(object({
    name              = string
    node_taint        = list(string)
    node_label        = list(string)
    userpool_min_node = any
    userpool_max_node = any
    vm_family         = string
  }))

}


# Variables for VM
variable "vm_family" {
  description = "Family of the virtual machine"
  type        = string
}

variable "vm_user" {
  description = "VM admin username"
  type        = string
}

variable "vm_password" {
  description = "VM password"
  type        = string
}

variable "vm_computer_name" {
  description = "The max length is 15"
  type        = string
}
