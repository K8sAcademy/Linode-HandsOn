terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.26.3"
    }
  }
}

provider "linode" {
  token = ""
}

data "linode_lke_cluster" "my-cluster" {
    id = [clusterId]
}