# harvester-modules

## harvester_clusternetwork
## harvester_image
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
