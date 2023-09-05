resource "oci_core_instance" "compute_instance" {
  availability_domain = var.availability_domain
  compartment_id = var.compartment_id
  display_name = var.vm_name
  shape = var.shape_id

  shape_config {
    memory_in_gbs = var.memory
    ocpus = var.ocpus
  }
 
  create_vnic_details {
    subnet_id = var.public_subnet_id
    display_name = "compute_instance"
    assign_public_ip = true
    #hostname_label = "compute_instance"
  }
 
  source_details {
    source_type = "image"
    source_id = var.image_id
    boot_volume_size_in_gbs = "50"
  } 
  
  metadata = {
    ssh_authorized_keys = var.ssh_authorized_key
  
  }
  timeouts {
    create = "60m"
  }
}

resource "null_resource" "copy_private_key" {
  provisioner "file" {
    connection {
      agent       = false
      timeout     = "30m"
      host        = oci_core_instance.compute_instance.public_ip
      user        = "opc"
      private_key = var.ssh_private_key
    }
  
    content = var.ssh_private_key
    destination = "~/.ssh/id_rsa.pem"
  } 
}
