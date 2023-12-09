locals {
  tags = {
    "Environment Type" = var.env
    "Resource Owner" = var.resource_owner
    #"Team" = var.team

    "Region"      = var.azure_region
  }
}