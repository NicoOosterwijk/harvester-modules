resource "harvester_clusternetwork" "vlan" {
  lifecycle {
    prevent_destroy = true
  }
  
  name                 = var.name
  enable               = true
  default_physical_nic = var.default_nic
}