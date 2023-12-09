variable "rg_name" {
  description = "resource group name"
  type        = string
}

variable "env" {
  description = "Environment name"
}

variable "region" {
    description = "Location of resources"
    type = string
}

variable "azure_region" {
  description = "Location"
  type        = string
}

variable "tags" {
  description = "List of common tags"
}

variable "aks_subnet" {
  description = "subnet to deploy AKS"
  type        = string
}

variable "min_node" {
  description = "Minimum nodes"
}

variable "max_node" {
  description = "Maximum number of nodes"
}

variable "vm_family" {
  description = "VM size"
}

variable "dns_name" {
  description = "common name"
}

variable "admin_group_id" {
  description = "AKS cluster Group object ID"
  type        = list(any)
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



