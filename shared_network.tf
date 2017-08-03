resource "opc_compute_security_list" "shared_network_sec_list_1" {
       	name = "Shared_Network_Security_List_1"
        policy = "permit"
        outbound_cidr_policy = "deny"
}

resource "opc_compute_security_ip_list" "sec_list_public_internet_1" {
	name = "Security_List_Public_Internet_1"
	ip_entries = ["0.0.0.0/0"]
}

resource "opc_compute_security_application" "sec_app_1" {
	name = "Shared_Network_Security_App_1"
	protocol = "tcp"
	dport = "22"
}

