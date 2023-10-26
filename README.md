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
 
    module "acf_resource_compute" {
        source = "https://github.com/avaloqcloud/acf_resource_compute"
    }

### File `versions.tf` content example:

```hcl
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.39"
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

