data "oci_core_subnet" "subnet" {
    #Required
    subnet_id = var.subnet_id
}

resource "oci_core_instance" "compute_instance" {
  availability_domain = var.availabilitydomain
  compartment_id = var.compartment_ocid
  display_name = var.vm_name
  shape = var.instance_shape

  create_vnic_details {
        #subnet_id = var.subnet_id
        assign_public_ip = var.assign_public_ip
    }


  shape_config {
    memory_in_gbs = var.memory
    ocpus = var.ocpus
  }
 
  source_details {
    source_type = "image"
    source_id = var.instance_image
    boot_volume_size_in_gbs = var.boot_volume_size_in_gbs
  } 
  
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = base64encode(var.cloud_init_script)

  }
  timeouts {
    create = "60m"
  }
}

output "instance_private_ip" {
  value = oci_core_instance.compute_instance.private_ip
  description = "Private ip of the instance"
}
