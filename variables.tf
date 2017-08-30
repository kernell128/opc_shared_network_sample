variable user {}
variable password {}
variable domain {}
variable endpoint {}

variable administrator_password {
	description = "initial administrator password to the set when launching the windows instance"
}

variable ssh_public_key_file {
	description = "MK002TF"
	default = "id_rsa.pub"
}
