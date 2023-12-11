# Data lookups of existing resources
## Compute Instance
data "oci_core_instance" "existing_instance" {
    #Required
    instance_id = var.instance.id      # var.oci_core_instance.test_instance.id
}
  # Filter - Important; Filter should be so that only ever one gets returned.
  filter {
    name   = "vm_name"
    values = ["${var.instance.vm_name}"]
  }




