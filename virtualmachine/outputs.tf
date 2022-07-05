
output "vm1_name" {
  value = harvester_virtualmachine.ubuntu20[0].name
}
output "vm1_ip" {
  value = harvester_virtualmachine.ubuntu20[0].network_interface[0].ip_address
}
output "vm2_name" {
  //value = "${harvester_virtualmachine.ubuntu20[1].name}"
  value = length(harvester_virtualmachine.ubuntu20) > 1 ? harvester_virtualmachine.ubuntu20[1].name : null
}
output "vm2_ip" {
  value = length(harvester_virtualmachine.ubuntu20) > 1 ? harvester_virtualmachine.ubuntu20[1].network_interface[0].ip_address : null
}
output "vm3_name" {
  //value = "${harvester_virtualmachine.ubuntu20[1].name}"
  value = length(harvester_virtualmachine.ubuntu20) > 2 ? harvester_virtualmachine.ubuntu20[2].name : null
}
output "vm3_ip" {
  value = length(harvester_virtualmachine.ubuntu20) > 2 ? harvester_virtualmachine.ubuntu20[2].network_interface[0].ip_address : null
}