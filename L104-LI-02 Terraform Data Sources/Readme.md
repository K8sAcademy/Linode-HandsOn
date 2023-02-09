# L104-LI-02

## Create a new LKE

Open a terminal and navigate to the **create** folder

    cd create

## Edit main.tf

List the Kubernetes versions available, copy the latest one and paste it in the **main.tf** file.

    linode-cli lke versions-list

You can replace the region and size values to your liking.

List the Linode sizes slugs

    linode-cli linodes types

List the regions slugs

    linode-cli regions list

## Initialize the create folder

    terraform init

## Let's create the cluster

    terraform apply

Wait for the cluster to be created.

## Use a Data Source

In the terminal, navigate to the **query** folder.

    cd ../query

## Edit the main.tf file

Copy the cluster ID and replace the [cluster ID] placeholder. Note that the value is numeric so don't use quotes.

    data "linode_lke_cluster" "my-cluster" {
        id = 56267
    }

## Initialize the query folder

    terraform init

## Query the data source

    terraform apply

## Cleanup

Navigate to the **create** folder.

    cd ../create
    terraform destroy
