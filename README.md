[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://objectstorage.eu-zurich-1.oraclecloud.com/p/KCZxzm1t58-_5dem2kcMb4BK8rmUvLLZSnjdBHnhOdIEmuJixokuKeBsMOMwZm0-/n/zrr2g2bttf8t/b/iso/o/acf_resource_compute_latest.zip)

## Terraform Compute Instance 
The code provides a reusuable Terraform module that provisions a compute instance on Oracle Cloud Infrastructure.  This modules does not create network resources like VCN, subnets, etc. 
Click on above "Deploy to Oracle Cloud" button to create compute instance using Oracle Resource Manager Stack.


## Usage

module "acf_resource_compute" {

    source = "https://github.com/avaloqcloud/acf_resource_compute"

}


## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | >= 4.101.0 |


