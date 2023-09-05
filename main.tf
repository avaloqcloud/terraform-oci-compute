// --- configuration --- //
module "compute" {
  source                    = "github.com/avaloqcloud/acf_resource_compute"
  compartment_id            = var.compartment_ocid
  availability_domain       = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")}"
  public_subnet_id          = oci_core_subnet.load_balancer_subnet.id
  ssh_authorized_key        = tls_private_key.ssh_key.public_key_openssh
  ssh_private_key           = tls_private_key.ssh_key.private_key_pem
  oci_cli_api_public_key    = tls_private_key.ssh_key.public_key_openssh
  oci_cli_api_private_key   = tls_private_key.ssh_key.private_key_pem
  user_id                   = var.current_user_ocid
  tenancy_id                = data.oci_identity_user.user.compartment_id
  depends_on                = [module.acf_resource_network]
}
