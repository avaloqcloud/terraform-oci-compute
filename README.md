[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/avaloqcloud/acf_resource_compute/archive/refs/tags/0.1.0.zip)

## Terraform Compute Instance 
The code provides a reusuable Terraform module that provisions a compute instance on Oracle Cloud Infrastructure.   

## Table of contents

* [Requirements](#requirements)
* [Usage](#usage)
* [Providers](#providers)
* [Resources](#resources)
* [Inputs](#inputs)
  

## Requirements
This modules does not create network resources like VCN, subnets, etc as it uses the existing network resources. Please use acf_res_net module for creating new network resources in OCI. 


## Usage
 
    module "terraform-oci-compute" {
        source = "github.com/avaloqcloud/terraform-oci-compute"
    }

### File `provider.tf` content example:

```hcl
terraform {
  required_version = "~> 1.2"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.39"
    }
    oci = {
      source  = "oracle/oci"
      version = "5.18.0"
    }
  }
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | n/a |


## Resources

| Name | Type |
|------|------|
| [oci_core_instance.compute_instance](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_instance) | resource |



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availabilitydomain"></a> [availabilitydomain](#input\_availabilitydomain) | Availability Domain | `string` | n/a | yes |
| <a name="input_boot_volume_size_in_gbs"></a> [boot\_volume\_size\_in\_gbs](#input\_boot\_volume\_size\_in\_gbs) | Compartment OCID | `string` | `"500"` | yes |
| <a name="input_cloud_init_script"></a> [cloud\_init\_script](#input\_cloud\_init\_script) | Cloud init script | `string` | n/a | yes |
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | Compartment OCID | `string` | n/a | yes |
| <a name="input_instance_image"></a> [instance\_image](#input\_instance\_image) | Image ID | `string` | n/a | yes |
| <a name="input_instance_shape"></a> [instance\_shape](#input\_instance\_shape) | Image Shape | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory size | `string` | n/a | yes |
| <a name="input_ocpus"></a> [ocpus](#input\_ocpus) | OCPU Size | `string` | n/a | yes |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | SSH public key | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | VM Name | `string` | n/a | yes |


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.39 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 5.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 5.18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_instance.compute_instance](https://registry.terraform.io/providers/oracle/oci/5.18.0/docs/resources/core_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | Assign public IP to the instance | `string` | `false` | no |
| <a name="input_availabilitydomain"></a> [availabilitydomain](#input\_availabilitydomain) | Availability Domain | `string` | n/a | yes |
| <a name="input_boot_volume_size_in_gbs"></a> [boot\_volume\_size\_in\_gbs](#input\_boot\_volume\_size\_in\_gbs) | Compartment OCID | `string` | `"500"` | no |
| <a name="input_cloud_init_script"></a> [cloud\_init\_script](#input\_cloud\_init\_script) | Cloud init script | `string` | `""` | no |
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | Compartment OCID | `string` | n/a | yes |
| <a name="input_defined_tags"></a> [defined\_tags](#input\_defined\_tags) | Specify the defined tag for compute VM | `map(string)` | `{}` | no |
| <a name="input_instance_image"></a> [instance\_image](#input\_instance\_image) | Image ID | `string` | n/a | yes |
| <a name="input_instance_shape"></a> [instance\_shape](#input\_instance\_shape) | Image Shape | `string` | n/a | yes |
| <a name="input_is_plugin_enabled"></a> [is\_plugin\_enabled](#input\_is\_plugin\_enabled) | Specify if the Bastion Plugin to be enabled in order to allows secure shell (SSH) connections to an instance without public IP addresses using the Bastion service. | `bool` | `false` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The OCID of the Vault service key to assign as the master encryption key for the boot volume. | `string` | `""` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory size | `string` | n/a | yes |
| <a name="input_nsg_ids"></a> [nsg\_ids](#input\_nsg\_ids) | List of Network Security Group IDs | `list(string)` | `[]` | no |
| <a name="input_ocpus"></a> [ocpus](#input\_ocpus) | OCPU Size | `string` | n/a | yes |
| <a name="input_plugin_name"></a> [plugin\_name](#input\_plugin\_name) | n/a | `string` | `""` | no |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | A private IP address of your choice to assign to the VNIC. Must be an available IP address within the subnet's CIDR. | `string` | `""` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | SSH public key | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | VM Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_compute_instance_id"></a> [compute\_instance\_id](#output\_compute\_instance\_id) | ID of the instance |
| <a name="output_instance_private_ip"></a> [instance\_private\_ip](#output\_instance\_private\_ip) | Private ip of the instance |
<!-- END_TF_DOCS -->