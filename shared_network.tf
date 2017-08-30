resource "opc_compute_security_list" "shared_network_sec_list_1" {
       	name = "shared_network_sec_list_1"
        policy = "deny"
        outbound_cidr_policy = "permit"
}
resource "opc_compute_security_ip_list" "sec_list_public_internet_1" {
	name = "sec_list_public_internet_1"
	ip_entries = ["0.0.0.0/0"]
}
resource "opc_compute_security_application" "sec_app_1" {
	name = "sec_app_1"
	protocol = "tcp"
	dport = "22"
}
resource "opc_compute_sec_rule" "security_ssh_allow" {
  name             = "security_ssh_allow"
  source_list      = "seciplist:${opc_compute_security_ip_list.sec_list_public_internet_1.name}"
  destination_list = "seclist:${opc_compute_security_list.shared_network_sec_list_1.name}"
  action           = "permit"
  application      = "${opc_compute_security_application.sec_app_1.name}"
}
