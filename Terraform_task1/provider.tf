terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  experiments = [module_variable_optional_attrs]
  }

backend "azurerm" {
  subscription_id = "94e12df9-8810-4706-a83d-06770afb5589"
  tenant_id       = "ab968060-1bea-4e12-ba68-c8579dd00e75"
  resource_group_name  = "rg-mapUp_Assesment"
  storage_account_name = "tfstatestjpmapup"
  container_name       = "tfstatefile"
  key                  = "mapUp_Assesment.terraform.tfstate"
  }
}

provider "azurerm" {
    features{}
    #subscription_id = ""
    #tenant_id = ""
}
