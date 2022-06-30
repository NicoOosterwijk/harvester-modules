resource "harvester_image" "image" {
  name      = var.name
  namespace = var.namespace

  display_name = var.display_name
  source_type  = var.source_type
  url          = var.url
}
