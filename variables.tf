variable "assign_public_ip" {
  type =        string
  description = "Assign public IP to the instance"
  default = false
}

variable "boot_volume_size_in_gbs" {
  type =        string
  description = "Compartment OCID"
  default = "500"
}

variable "compartment_ocid" {
  type =        string
  description = "Compartment OCID"
}

variable "cloud_init_script" {
  type = string
  description = "Cloud init script"
}

 variable "subnet_id" {
  type = string
  description = "Subnet ID"
   
 }

variable "private_ip" {
  type = string
  description = "A private IP address of your choice to assign to the VNIC. Must be an available IP address within the subnet's CIDR."
  default = ""
}

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

 variable "is_plugin_enabled" {
  type = bool
  default = false
  description = "Specify if the Bastion Plugin to be enabled in order to allows secure shell (SSH) connections to an instance without public IP addresses using the Bastion service."
 }

variable "plugin_name" {
  type = string
  default = ""
}

 variable "defined_tags" {
  type        = map(string)
  default     = {}
  description = "Specify the defined tag for compute VM"
}

