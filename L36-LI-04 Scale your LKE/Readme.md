# L36-LI-04

Let's scale our cluster.

## Cloud Manager

Locate your cluster in Cloud Manager.

Click on **Resize Pool**, change the number of nodes from 3 to 2.  Click on the **Save Changes** button.

## Terminal

Open a terminal and list the nodes.

    kubectl get no

Let's scale back to 3 nodes. Get your cluster ID

    linode-cli lke clusters-list

Get the node pool ID

    linode-cli lke pools-list [clusterID]

Update the node count

    linode-cli lke pool-update [clusterID] [poolID] --count 3

Validate

    kubectl get no