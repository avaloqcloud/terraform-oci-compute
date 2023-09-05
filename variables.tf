variable "compartment_id" {
   description = "The compartment Id within the OCI (Oracle Cloud Infrastructure) tenancy"
}

variable "compartment_ocid" {
   description = "The compartment Id within the OCI (Oracle Cloud Infrastructure) tenancy"
}

variable "current_user_ocid" {
  description = "The userId associated with the OCI (Oracle Cloud Infrastructure) account"
}

variable "region" {
  default = "eu-zurich-1"
  description = "The OCI (Oracle Cloud Infrastructure) region where resources will be provisioned"
}

variable "image_id" {
  description = "Image ID"
}

variable "memory" {
  description = "Memory size"
}

variable "ocpus" {
  description = "OCPU Size"
}

variable "shape_id" {
  description = "Image Shape"
}

variable "vm_name" {
  description = "VM Name"
}
