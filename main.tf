resource "oci_core_instance" "compute_instance" {
  availability_domain = var.availabilitydomain
  compartment_id = var.compartment_ocid
  display_name = var.vm_name
  shape = var.instance_shape

  /* agent_config {
    are_all_plugins_disabled = false
    is_management_disabled = true
    is_monitoring_disabled = true
    
    # Add plugins_config block only if is_bastion_plugin_enabled is true
    dynamic "plugins_config" {
      for_each = var.is_plugin_enabled == true ? [1] : []
      content {
        name          = var.plugin_name
        desired_state = "ENABLED"
      }
    }
  } */

	agent_config {
    #for_each = var.is_plugin_enabled == true ? [1] : []
    are_all_plugins_disabled = false
    is_management_disabled = true
    is_monitoring_disabled = true
    
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "OS Management Service Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute Instance Run Command"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Block Volume Management"
		}
    plugins_config {
			desired_state = "ENABLED"
			name = "Bastion"
		}
	}

  create_vnic_details {
        subnet_id = var.subnet_id
        assign_public_ip = var.assign_public_ip
        private_ip = var.private_ip
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
  defined_tags = var.defined_tags
}

output "instance_private_ip" {
  value = oci_core_instance.compute_instance.private_ip
  description = "Private ip of the instance"
}
output "compute_instance_id" {
  value = oci_core_instance.compute_instance.id
  description = "ID of the instance"
}
