resource "opc_compute_storage_volume" "vm-1_bootvol" {
	size = "50"
	description = "Example bootable storage volume"
	name = "vm-1_bootvol"
	bootable = true
	image_list = "/oracle/public/OL_7.2_UEKR3_x86_64"
	image_list_entry = 2
}

resource "opc_compute_storage_volume" "vm-1_datavol" {
	size = "50"
	description = "Example persistent storage volume"
	name = "vm-1_datavol"
}

resource "opc_compute_instance" "vm-1" {
	name = "vm-1"
	label = "My Oracle Linux 7.2 UEK3 Server"
	shape = "oc3"
	image_list = "/oracle/public/OL_7.2_UEKR3_x86_64"
	ssh_keys = [ "${opc_compute_ssh_key.sshkey1.name}" ]
	storage {
		index = 1
		volume = "${opc_compute_storage_volume.vm-1_bootvol.name}"
	}
  	storage {
		index = 2
		volume = "${opc_compute_storage_volume.vm-1_datavol.name}"
	}
	boot_order = [ 1 ]
}

resource "opc_compute_ip_reservation" "vm-1-ipreservation1" {
  name = "vm-1-ipreservation1"
  parent_pool = "/oracle/public/ippool"
  permanent = true
}

resource "opc_compute_ip_association" "vm-1-ipreservation" {
  vcable = "${opc_compute_instance.vm-1.vcable}"
  parent_pool = "ipreservation:${opc_compute_ip_reservation.vm-1-ipreservation1.name}"
}
