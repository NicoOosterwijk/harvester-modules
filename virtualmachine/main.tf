resource "harvester_virtualmachine" "ubuntu20" {
  count     = var.number_of_hosts
  name      = "${var.prefix}-0${count.index + 1}"
  namespace = var.namespace

  tags = {
    ssh-user = var.ssh_user
  }

  network_interface {
    name         = var.nic_name
    network_name = var.nic_network
  }

  ## Boot disk
  dynamic "disk" {
    for_each = [for disk in var.disk1 : disk]
    content {
      name        = disk.value.name
      type        = disk.value.type
      size        = disk.value.size
      bus         = disk.value.bus
      boot_order  = disk.value.boot_order
      image       = disk.value.image
      auto_delete = disk.value.auto_delete
    }
  }

  ## additional disks
  dynamic "disk" {
    for_each = [for disk in var.extradisks : disk]
    content {
      name        = disk.value.name
      type        = disk.value.type
      size        = disk.value.size
      bus         = disk.value.bus
      boot_order  = disk.value.boot_order
      image       = disk.value.image
      auto_delete = disk.value.auto_delete
    }
  }

  cpu          = var.cpu
  memory       = var.memory
  run_strategy = var.run_strategy
  hostname     = "${var.prefix}-0${count.index + 1}"
  machine_type = var.machine_type

  cloudinit {
    user_data    = var.user_data
    network_data = var.network_data
  }
}


output "vm_name" {
  value = "${harvester_virtualmachine.ubuntu20[*].name}"
}
output "vm_ip" {
  value = "${harvester_virtualmachine.ubuntu20[*].network_interface[*].ip_address}"
}