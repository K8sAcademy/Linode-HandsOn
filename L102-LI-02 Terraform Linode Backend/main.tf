terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.26.3"
    }
  }
    backend "s3" {
    access_key                  = ""
    secret_key                  = ""
    endpoint                    = "us-east-1.linodeobjects.com" // your endpoint
    bucket                      = ""           // your bucket
    key                         = "lab/terraform.tfstate"
    skip_credentials_validation = true
    region                      = "us-east-1"
  }
}

provider "linode" {
  token = ""
}


resource "linode_instance" "lab" {
    label = "k8sacademy"
    image = "linode/ubuntu21.04"
    region = "ca-central"
    type = "g6-nanode-1"
    root_pass = "terr4form-test"
}

output "linode_ip_address" {
  value = linode_instance.lab.ip_address
}
