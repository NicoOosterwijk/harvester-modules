# harvester-modules

## harvester_clusternetwork
## harvester_image
## harvester_network
## harvester_ssh_key
Usage:
```
module "ssh-key" {
  source     = "github.com/nicooosterwijk/harvester-modules/ssh-key"
  name       = "rancher"
  namespace  = "default"
  public_key = "ssh-rsa keyvalue"
  kubeconfig = "harvester.yaml"
}
```
## harvester_virtualmachine
## harvester_volume
