variable "compartment_ocid" {
  type =        string
  description = "Compartment OCID"
}

variable "cloud_init_script" {
  type = string
  description = "Cloud init script"
}

variable "instance_tag" {
  type = string
  description = "Instance Tag"
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

variable "region" {
  type =        string
  description = "OCI Region"
}

 variable "availabilitydomain" {
   type = string
   description = "Availability Domain"
 }
 
