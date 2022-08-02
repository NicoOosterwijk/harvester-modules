resource "harvester_volume" "image-disk" { 
  namespace = var.namespace

  name  = var.name
  size  = var.size
  image = var.image
}
