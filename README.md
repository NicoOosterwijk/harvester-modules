# harvester-modules

## harvester_clusternetwork
## harvester_image
```
module "harvester_image" {
  source     = "github.com/nicooosterwijk/harvester-modules/images"
  name       = "k3os"              // or whatever you want
  namespace  = "harvester-public"  // the namespace in Harvester
  kubeconfig = "harvester.yaml"    // your kubeconfig file

  display_name = "k3os"            // display name
  source_type  = "download"        // this must be either "download" or "export-from-volume"
  url          = "https://github.com/rancher/k3os/releases/download/v0.20.6-k3s1r0/k3os-amd64.iso"
}
```
***url*** is required when source_type = "download"

***pvc_namespace*** and ***pvc_name*** are required when source_type = "export-from-volume"

## harvester_network
## harvester_ssh_key
Usage:
```
module "ssh-key" {
  source     = "github.com/nicooosterwijk/harvester-modules/ssh-key"
  name       = "rancher"          // or whatever you like
  namespace  = "default"          // or the namespace you want in Harvester

  public_key = "ssh-rsa keyvalue" // your public key
  kubeconfig = "harvester.yaml"   // the kubeconfig file for your harvester cluster
}
```
## harvester_virtualmachine
## harvester_volume
