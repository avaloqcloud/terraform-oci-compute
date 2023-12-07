variable "instance" {
  description = "Compute instance input object"
  type = object({
    assign_public_ip = string, #default = false
    boot_volume_size_in_gbs = number, #default = "500"
    compartment_ocid = string,
    cloud_init_script = string,
    subnet_id = string,
    ssh_public_key = string,
    instance_shape = string,
    instance_image = string,
    memory = number,
    ocpus = number,
    vm_name = string,
    availabilitydomain = string
  })
}

