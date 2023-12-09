variable "rg_name" {
  description = "resource group name"
  type        = string
}

variable "region" {
  description = "Location"
  type        = string
}

variable "azure_region" {
  description = "Location"
  type        = string
}

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

variable "vm_subnet_id" {
  description = "The virtual machine subnet id"
  type        = string
}
variable "env" {
  description = "environment name"
}