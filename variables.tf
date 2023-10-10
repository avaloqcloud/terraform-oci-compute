#variable "image_compartment" {
#  type =        string
#  description = "Compartment OCID"
#}

#variable "vcnCompartment" {
#  type =        string
#  description = "Compartment OCID"
#}

#variable "subnetCompartment" {
#  type =        string
#  description = "Compartment OCID"
#}

variable "boot_volume_size_in_gbs" {
  type =        string
  description = "Compartment OCID"
  default = "500"
}

variable "compartment_ocid" {
  type =        string
  description = "Compartment OCID"
}

variable "instance_fault_domain" {
  type = string
  description = "Choose fault domain"
  default = "FAULT-DOMAIN-1"
}

variable "cloud_init_script" {
  type = string
  description = "Cloud init script"
}

 variable "subnet_id" {
  type = string
  description = "Subnet ID"
   
 }

#variable "instance_tag" {
#  type = string
#  description = "Instance Tag"
#}

variable "ssh_public_key" {
  type = string
  description = "SSH public key"
}

variable "instance_shape" {
  type =        string
  description = "Image Shape"
}

variable "instance_image" {
  type =        string
  description = "Image ID"
}

variable "memory" {
  type =        string
  description = "Memory size"
}

variable "ocpus" {
  type =        string
  description = "OCPU Size"
}

variable "vm_name" {
  type =        string
  description = "VM Name"
}

 variable "availabilitydomain" {
   type = string
   description = "Availability Domain"
 }

# variable "oci_core_compute_cluster_id" {
#  type = string
#  description = "Compute Cluster ID"
#   
# }
