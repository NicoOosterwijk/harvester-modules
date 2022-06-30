resource "harvester_ssh_key" "rancher" {
  name      = var.name
  namespace = var.namespace
  
  public_key = var.public_key
}
