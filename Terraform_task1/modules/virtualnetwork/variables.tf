terraform {
  experiments = [module_variable_optional_attrs]
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used in the virtual network"
  default     = ["10.12.0.0/16"]
}

variable "azure_region" {
    description = "Azure location"
    type = string
}

variable "env" {
  description = "Environment name"
}

variable "tags" {
  description = "List of common tags"
}

variable "rg_name" {
    description = "Resource group name"
    type = string
}

variable "region" {
    description = "Location of resources"
    type = string
}

variable "subnets" {
  type = list(object({
    name                                      = string
    address_prefixes                          = list(string)
    service_endpoints                         = optional(list(string))
    private_endpoint_network_policies_enabled = optional(bool)
  }))
  description = "List of objects that represent the configuration of each subnet."
}
