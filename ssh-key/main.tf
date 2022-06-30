resource "harvester_ssh_key" "rancher" {
  name      = var.name
  namespace = var.namespace
  run_strategy = "RerunOnFailure"
  public_key = var.public_key
}
