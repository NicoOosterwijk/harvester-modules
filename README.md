# harvester-modules

Usage:

## harvester_clusternetwork
```
module "harvester_clusternetwork" {
  source               = "github.com/nicooosterwijk/harvester-modules/clusternetwork"
  name                 = "vlan"             // or whatever you like
  kubeconfig           = "harvester.yaml"    // the kubeconfig file for your harvester cluster

  default_nic          = "harvester-mgmt"   // or a dedicated nic
}
```
## harvester_image
```
module "harvester_image" {
  source     = "github.com/nicooosterwijk/harvester-modules/images"
  name       = "k3os"              // or whatever you like
  namespace  = "harvester-public"  // the namespace in harvester
  kubeconfig = "harvester.yaml"    // the kubeconfig file for your harvester cluster

  display_name = "k3os"            // display name
  source_type  = "download"        // this must be either "download" or "export-from-volume"
  url          = "https://github.com/rancher/k3os/releases/download/v0.20.6-k3s1r0/k3os-amd64.iso"
}
```
***url*** is required when source_type = "download"

***pvc_namespace*** and ***pvc_name*** are required when source_type = "export-from-volume"

## harvester_network
```
module "harvester_clusternetwork" {
  source     = "github.com/nicooosterwijk/harvester-modules/network"
  kubeconfig = "/Users/nicoo/.kube/harvester" // the kubeconfig file for your harvester cluster

  namespace = "default"  // the namespace in harvester
  name      = "vlan1"    // or whatever you like
  vlan_id   = "1"        // the vlan id
}
```
## harvester_ssh_key
```
module "harvester_ssh_key" {
  source     = "github.com/nicooosterwijk/harvester-modules/ssh-key"
  name       = "rancher"          // or whatever you like
  namespace  = "default"          // the namespace in harvester
  kubeconfig = "harvester.yaml"   // the kubeconfig file for your harvester cluster

  public_key = "ssh-rsa keyvalue" // your public key
}
```
## harvester_virtualmachine
## harvester_volume
