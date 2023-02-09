# L102-LI-03

## Create a new LKE

We'll use the linode_lke_cluster resource from the Linode prodider. The documentation is available here:
https://registry.terraform.io/providers/linode/linode/latest/docs/resources/lke_cluster

## Initialize

    terraform init

## Edit main.tf

List the Kubernetes versions available, copy the latest one and paste it in the **main.tf** file.

    linode-cli lke versions-list

You can replace the region and size values to your liking.

List the Linode sizes slugs

    linode-cli linodes types

List the regions slugs

    linode-cli regions list

## Let's test the plan

    terraform validate
    terraform plan

## Let's create the cluster

    terraform apply

Head to the Web console and validate the cluster creation.

## Cleanup

    terraform destroy
