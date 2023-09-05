data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.compartment_ocid
}
#data "oci_identity_user" "user" {
#    user_id  = var.current_user_ocid
#}
