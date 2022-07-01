resource "harvester_virtualmachine" "vm" {
  name      = var.name
  namespace = var.namespace

  disk              = var.disk
  network_interface = var.nic
}
