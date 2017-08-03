resource "opc_compute_ssh_key" "sshkey1" {
  name = "TerraForm-sshkey1"
  key = "${file(var.ssh_public_key_file)}"
  enabled = true
}
