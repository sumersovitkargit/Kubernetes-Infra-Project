## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks"></a> [aks](#module\_aks) | ./modules/aks | n/a |
| <a name="module_azurecontainerregistry"></a> [azurecontainerregistry](#module\_azurecontainerregistry) | ./modules/azurecontainerregistry | n/a |
| <a name="module_resourcegroup"></a> [resourcegroup](#module\_resourcegroup) | ./modules/resourcegroup | n/a |
| <a name="module_storageaccount"></a> [storageaccount](#module\_storageaccount) | ./modules/storageaccount | n/a |
| <a name="module_virtualmachine"></a> [virtualmachine](#module\_virtualmachine) | ./modules/virtualmachine | n/a |
| <a name="module_virtualnetwork"></a> [virtualnetwork](#module\_virtualnetwork) | ./modules/virtualnetwork | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used in the virtual network | `list(string)` | <pre>[<br>  "10.12.0.0/16"<br>]</pre> | no |
| <a name="input_admin_group_id"></a> [admin\_group\_id](#input\_admin\_group\_id) | AKS cluster Group object ID | `list(any)` | n/a | yes |
| <a name="input_azure_region"></a> [azure\_region](#input\_azure\_region) | Azure location | `string` | n/a | yes |
| <a name="input_dns_name"></a> [dns\_name](#input\_dns\_name) | common name | `any` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment name | `any` | n/a | yes |
| <a name="input_max_node"></a> [max\_node](#input\_max\_node) | Maximum number of nodes | `any` | n/a | yes |
| <a name="input_min_node"></a> [min\_node](#input\_min\_node) | Minimum nodes | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Location of resources | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of objects that represent the configuration of each subnet. | `list(any)` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Tenant ID | `string` | n/a | yes |
| <a name="input_usernode_pool"></a> [usernode\_pool](#input\_usernode\_pool) | list of the usernode pool | `list(any)` | <pre>[<br>  "userpool1",<br>  "userpool2"<br>]</pre> | no |
| <a name="input_userpool_details"></a> [userpool\_details](#input\_userpool\_details) | n/a | <pre>list(object({<br>    name              = string<br>    node_taint        = list(string)<br>    node_label        = list(string)<br>    userpool_min_node = any<br>    userpool_max_node = any<br>    vm_family         = string<br>  }))</pre> | n/a | yes |
| <a name="input_vm_computer_name"></a> [vm\_computer\_name](#input\_vm\_computer\_name) | The max length is 15 | `string` | n/a | yes |
| <a name="input_vm_family"></a> [vm\_family](#input\_vm\_family) | Family of the virtual machine | `string` | n/a | yes |
| <a name="input_vm_password"></a> [vm\_password](#input\_vm\_password) | VM password | `string` | n/a | yes |
| <a name="input_vm_user"></a> [vm\_user](#input\_vm\_user) | VM admin username | `string` | n/a | yes |
| <a name="input_workspace_sku"></a> [workspace\_sku](#input\_workspace\_sku) | SKU of the Log Analytics Workspace | `string` | `"PerGB2018"` | no |

## Outputs

The azure infrastucture is deployed using the Github Actions
