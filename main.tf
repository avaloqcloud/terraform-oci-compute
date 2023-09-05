resource "oci_core_instance" "compute_instance" {
  availability_domain = var.availability_domain
  compartment_id = var.compartment_ocid
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

resource "oci_core_vcn" "compute_vcn" {
  #Required
  cidr_block     = "${lookup(local.network_cidrs, "vcn_cidr")}"
  compartment_id = var.compartment_ocid

}

# https://www.terraform.io/docs/providers/oci/r/core_security_list.html
resource "oci_core_security_list" "worker_node_sl" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = "${oci_core_vcn.compute_vcn.id}"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol = "all" 
  }

  ingress_security_rules {
    protocol = "all" 
    source = "0.0.0.0/0"
  }
  #Optional
  display_name = "worker node security list"
}


resource "oci_core_subnet" "load_balancer_subnet" {
  #Required
  cidr_block        = "${lookup(local.network_cidrs, "load_balancer_subnet_cidr")}"
  compartment_id    = var.compartment_ocid
  security_list_ids = ["${oci_core_security_list.worker_node_sl.id}"]
  vcn_id            = "${oci_core_vcn.compute_vcn.id}"

  #Optional
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")}"
  dhcp_options_id     = "${oci_core_vcn.compute_vcn.default_dhcp_options_id}"
  display_name        = "load balancer subnet"
  #dns_label           = "lb"
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "oci_identity_api_key" "user_api_key" {
    #Required
    key_value = tls_private_key.ssh_key.public_key_pem
    user_id   = var.current_user_ocid
}
