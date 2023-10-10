#provider "oci" {
#  region = "${var.region}"
#}

#data "oci_identity_availability_domains" "ADs" {
#  compartment_id = var.compartment_ocid
#}

resource "oci_core_instance" "compute_instance" {
  #availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")}"
  availability_domain = var.availabilitydomain
  compartment_id = var.compartment_ocid
  display_name = var.vm_name
  shape = var.instance_shape
  #compute_cluster_id = var.oci_core_compute_cluster_id
  fault_domain = var.instance_fault_domain

  #freeform_tags  = {"instance-name"="${var.vm_name}"}
  #defined_tags   = {"instance-name"="${var.vm_name}"}


  create_vnic_details {

        #Optional
        subnet_id = var.subnet_id
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
    #ssh_authorized_keys = tls_private_key.ssh_key.public_key_openssh
    user_data = base64encode(var.cloud_init_script)
    #user_data = var.cloud_init_script
  
  }
  timeouts {
    create = "60m"
  }
}

output "instance_private_ip" {
  value = oci_core_instance.compute_instance.private_ip
  description = "Private ip of bastion host"
}
