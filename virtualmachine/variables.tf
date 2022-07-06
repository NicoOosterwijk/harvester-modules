variable "kubeconfig" {}
variable "namespace" {}
variable "number_of_hosts" {}
variable "prefix" {}
variable "cpu" {}
variable "memory" {}
variable "run_strategy" {}
//variable "hostname" {}
variable "machine_type" {}
variable "nic_name" {}
variable "nic_network" {}
variable "ssh_public_key" {}
variable "ssh_user" {}
variable "disk1" {}
variable "extradisks" {}
variable "user_data" {}
variable "network_data" {}

variable "nodes" {
    description = "Cluster Nodes configuration"
    type = map(object({
        num_cpus      = number
        memory        = number
        roles         = list(string)
        template_name = string
        os_disk_size  = number
        num_nodes     = optional(number)
        enable_longhorn_storage              = optional(bool)
        enable_longhorn_exclusive_scheduling = optional(bool)
        enable_longhorn_data_locality        = optional(bool)
    }))
}
