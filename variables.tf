variable "compartment_ocid" {
  type =        string
  description = "Compartment OCID"
}

#variable "availability_domain" {
#  type =        string
#  description = "Availability Domain"
#}

#variable "public_subnet_id" {
#  type =        string
#  description = "OCID of public subnet in which to create a compute_instance host"
#}

variable "shape_id" {
  type =        string
  description = "Image Shape"
}

variable "image_id" {
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

#variable "ssh_authorized_key" {
#  type =        string
#  description = "RSA public key in PEM format. It will added as authorized key for remote connection over SSH"
#}

#variable "ssh_private_key" {
#  type =        string
#  description = "SSH Private key in PEM format. The private key will be used for connecting to the VMs (compute_instance, ACP, OKE nodes) over SSH"
#}

variable "oci_cli_api_public_key" {
  type =        string
  description = "RSA Public key in PEM format. It will be configured as API key in OCI for authenticating OCI CLI running on compute_instance host."
}

variable "oci_cli_api_private_key" {
  type =        string
  description = "RSA Private key in PEM format. It will be will be required for authenticating OCI CLI running on compute_instance host."
}

variable "user_id" {
  type =        string
  description= "The user's OCID must be set up to enable authentication via the OCI CLI."
}

variable "tenancy_id" {
  type =        string
  description= "The Tenancy's OCID must be set up to enable authentication via the OCI CLI."
}
