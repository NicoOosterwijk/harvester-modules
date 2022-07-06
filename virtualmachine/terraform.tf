terraform {
  required_providers {
    harvester = {
      source  = "harvester/harvester"
      version = "0.4.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

provider "harvester" {
  # Configuration options
  kubeconfig = var.kubeconfig
}

