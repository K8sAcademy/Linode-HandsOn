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


resource "linode_lke_cluster" "lkelab" {
    label       = "lkelab"
    k8s_version = ""
    region      = "ca-central"

    pool {
        type  = "g6-standard-2"
        count = 1
    }
}

output "cluster_ID" {
  value = linode_lke_cluster.lkelab.id
}
