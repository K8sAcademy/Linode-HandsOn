# L32-LI-02

Let's connect to our cluster.

## Cloud Manager

In Cloud Manager, select the cluster you created earlier or create a new one.

In the Kubeconfig section, click on the download button. 

## Set the KUBECONFIG env variable

Open a terminal.

Set the KUBECONFIG enev variable by using the syntax for your OS

Linux/Mac

    export KUBECONFIG=C:\Linode\lab-kubeconfig.yaml

Powershell

    $env:KUBECONFIG="C:\Linode\lab-kubeconfig.yaml"

DOS

    set KUBECONFIG="C:\Linode\lab-kubeconfig.yaml"

## Change context

List the contexts

    kubectl config get-contexts

Change context

    kubectl config use-context [contextName] 

List the nodes

    kubectl get nodes -o wide

## Close the terminal

Close the terminal and open a new one.  Our context is gone!

## Edit the local Kubeconfig file

Using VS Code, open the local Kubeconfig file

Mac

    ${HOME}/.kube/config

Windows

    C:\Users\{USER}\.kube\config

Open the Linode Kubeconfig you previously downloaded

Copy the Clusters, Name and Context section

## Change context

In a new terminal, list the contexts

    kubectl config get-contexts

Change context

    kubectl config use-context [contextName] 

List the nodes

    kubectl get nodes -o wide 

## Voting app

The source code is available here: https://github.com/dockersamples/example-voting-app

## Deploy the app

    kubectl create namespace vote
    kubectl create -f vote/

## Get the pods info

    kubectl get pods -n vote

## Get the services info

    kubectl get svc -n vote   

## Monitor the load balancers configuration progress

    kubectl get svc -n vote --watch

In Cloud Manager, click on the NodeBalancers menu and locate the two load balancers

Get the external IP for the **vote** service and test in a browser using port 5000.

Get the external IP for the **result** service and test in a browser to see the results using port 5001.

## Cleanup

Deleting the namespace will delete all the child ressources.

    kubectl delete ns vote

Optionally, delete the cluster.
