resource "harvester_image" "image" {
  name      = var.name
  namespace = var.namespace
  public_key = var.public_key
}
