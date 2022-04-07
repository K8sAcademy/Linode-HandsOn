terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.26.3"
    }
  }
  cloud {
    organization = ""

    workspaces {
      name = ""
    }
  }
}

provider "linode" {
  token = var.linode_token
}


resource "linode_instance" "lab" {
  label     = var.linode_name
  image     = "linode/ubuntu21.04"
  region    = var.linode_region
  type      = "g6-nanode-1"
  root_pass = var.root_password
}

output "linode_ip_address" {
  value = linode_instance.lab.ip_address
}
