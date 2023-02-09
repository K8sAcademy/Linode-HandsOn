# L31-LI-03

## Cloud Manager

In Cloud Manager, click on Kubernetes in the left menu and click on the **Create Cluster** button.

Name your cluster, select a data center near you and select a Kubernetes version.

Add a Node Pool with the VM size of your choice.

Click on the **Create Cluster** button.  The process should take a couple of minutes to complete.

---

## Linode CLI

Open a terminal.

We need to get the region code from the regions list.

    linode-cli regions list

Copy the region code for the data center near you.

We need to get the VM size code from the Linode types list.

    linode-cli linodes types

Copy the code for the size you want to use.  Recommended size: g6-standard-1

ca-central

## Create the cluster

Replace the values in the following command with the values you want to use

    linode-cli lke cluster-create --label lab2 --region us-central --k8s_version 1.21 --node_pools.type g6-standard-1 --node_pools.count 3 --tags k8sacademy

Let's get a list of the clusters

    linode-cli lke clusters-list

## Cleanup

_Do not delete the 1st cluster, the one that you created using the Cloud Manager._

Delete the cluster you created using the CLI.

Get the cluster ID

Delete the cluster

Confirm by listing again

    linode-cli lke clusters-list
