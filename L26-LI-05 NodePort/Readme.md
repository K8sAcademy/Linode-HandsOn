# L26-LI-05

Let's expose a deployment using a Nodeport service.

## Deploy the app

    kubectl apply -f deploy-app.yaml

## Deploy the NodePort service

    kubectl apply -f nodeport.yaml

## Get the pods list

    kubectl get pods -o wide
 
## Use the nodeport

Get the node public IP address

    kubectl get nodes -o wide

Open a browser and use the IP address of the node + the nodeport

## Cleanup

    kubectl delete -f nodeport.yaml
    kubectl delete -f deploy-app.yaml
