resource "oci_artifacts_container_repository" "this" {
  for_each = local.potential_registry
  # Required
  compartment_id = each.value.compartment_id
  display_name   = each.value.display_name
  # Optional
  defined_tags  = each.value.defined_tags
  freeform_tags = each.value.freeform_tags
}


resource "oci_core_instance" "this" {
  for_each = local.potential_instance
  availability_domain = each.value.availabilitydomain
  compartment_id = each.value.compartment_ocid
  display_name = each.value.vm_name
  shape = each.value.instance_shape

  create_vnic_details {
        subnet_id = each.value.subnet_id
        assign_public_ip = each.value..assign_public_ip
    }


  shape_config {
    memory_in_gbs = each.value..memory
    ocpus = each.value.ocpus
  }
 
  source_details {
    source_type = "image"
    source_id = each.value.instance_image
    boot_volume_size_in_gbs = each.value.boot_volume_size_in_gbs
  } 
  
  metadata = {
    ssh_authorized_keys = each.value.ssh_public_key
    user_data = base64encode(each.value.cloud_init_script)

  }
  timeouts {
    create = "60m"
  }
}

#output "instance_private_ip" {
#  value = oci_core_instance.compute_instance.private_ip
#  description = "Private ip of the instance"
#}
#output "compute_instance_id" {
#  value = oci_core_instance.compute_instance.id
#  description = "ID of the instance"
#}
