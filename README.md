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
```
module "harvester_virtualmachine" {
  source     = "github.com/nicooosterwijk/harvester-modules/virtualmachine"
  kubeconfig = "harvester.yaml"   // the kubeconfig file for your harvester cluster

  number_of_hosts = 1
  prefix          = "test"        // your hosts will be named test-0 followed by the count.index
  namespace       = "default"     // the namespace in harvester

  cpu          = 2                // the resources used by the VM
  memory       = "2Gi"
  run_strategy = "RerunOnFailure"
  machine_type = "q35"
  nic_name    = "enp1s0"
  nic_network = "vlan1"

  ssh_user = "rancher"            // the ssh-user to logon with ssh

  disk1 = [                       // root-disk parameters
    {
      name        = "rootdisk"
      type        = "disk"
      size        = "10Gi"
      bus         = "virtio"
      boot_order  = 1
      image       = "default/ubuntu20"  // format is namespace/image_id
      auto_delete = true
    }
  ]

  extradisks = [                  // additional disks can be configured here
    {
      name        = "emptydisk"
      type        = "disk"
      size        = "20Gi"
      bus         = "virtio"
      boot_order  = 2
      image       = ""
      auto_delete = true
      # },
      # {
      #   name        = "longhorn"
      #   type        = "disk"
      #   size        = "100Gi"
      #   bus         = "virtio"
      #   boot_order  = 3
      #   image       = ""
      #   auto_delete = true
    }
  ]
  ssh_public_key = "sha-...."     // your ssh key for ssh_user
  user_data = ""                  // user_data part for cloud_init
  network_data = ""               // network_data part for cloud-init
}
```
## harvester_volume
```
module "harvester_volume" {
  source     = "github.com/nicooosterwijk/harvester-modules/volume"
  kubeconfig = "harvester.yaml" // the kubeconfig file for your harvester cluster

  namespace = "default"                   // the namespace in Harvester
  name      = "ubuntu20-dev-image-disk"   // name the volume
  size      = "10Gi"                      // give it a size
  image     = "harvester-public/ubuntu20" // the image to be used
}
```
Leave ***image*** empty to create an empty volume
