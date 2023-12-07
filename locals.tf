locals {
    
    potential_resource = length(data.oci_core_instance.existing_instance.instance_collection[0].items) < 1 ? {
	"resource" = {
            container_instance_id         = var.instance.instance_id != null ? var.instance.instance_id : null		
			assign_public_ip              = var.instance.assign_public_ip
            boot_volume_size_in_gbs       = var.instance.boot_volume_size_in_gbs
            compartment_ocid              = var.instance.compartment_ocid
            cloud_init_script             = var.instance.cloud_init_script
            subnet_id                     = var.instance.subnet_id
            ssh_public_key                = var.instance.ssh_public_key
            instance_shape                = var.instance.instance_shape
            instance_image                = var.instance.instance_image
            memory                        = var.instance.memory
            ocpus                         = var.instance.ocpus
            vm_name                       = var.instance.vm_name
            availabilitydomain            = var.instance.availabilitydomain
        }
    }

    pre_existing_output_instance = length(data.oci_core_instance.existing_instance.instance_collection[0].items) > 0 ? {
      	"resource" = {
      	    compartment_ocid              = data.oci_core_instance.existing_instance.instance_collection[0].items[0].compartment_id
			assign_public_ip              = data.oci_core_instance.existing_instance.instance_collection[0].items[0].assign_public_ip
            boot_volume_size_in_gbs       = data.oci_core_instance.existing_instance.instance_collection[0].items[0].boot_volume_size_in_gbs
            cloud_init_script             = data.oci_core_instance.existing_instance.instance_collection[0].items[0].cloud_init_script 
            subnet_id                     = data.oci_core_instance.existing_instance.instance_collection[0].items[0].subnet_id
            ssh_public_key                = data.oci_core_instance.existing_instance.instance_collection[0].items[0].ssh_public_key
            instance_shape                = data.oci_core_instance.existing_instance.instance_collection[0].items[0].instance_shape
            instance_image                = data.oci_core_instance.existing_instance.instance_collection[0].items[0].instance_image
            memory                        = data.oci_core_instance.existing_instance.instance_collection[0].items[0].memory
            ocpus                         = data.oci_core_instance.existing_instance.instance_collection[0].items[0].ocpus
            vm_name                       = data.oci_core_instance.existing_instance.instance_collection[0].items[0].vm_name 
            availabilitydomain            = data.oci_core_instance.existing_instance.instance_collection[0].items[0].availabilitydomain
        }
    } : {}

    output_instance = merge(oci_core_instance.this, local.pre_existing_output_instance)
}
