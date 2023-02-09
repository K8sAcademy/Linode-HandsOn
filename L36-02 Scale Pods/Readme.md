# L36-LI-02

Let's use the Horizontal Pod Autoscaler to scale a pod.

## Metrics Server

Is the Metrics Server installed in your cluster?  Look for a namespace called **metrics-server** 

    kubectl get ns 

If not, install the Metrics Server using the Bitnami Helm chart.

    helm repo add bitnami https://charts.bitnami.com/bitnami
    helm repo update
    helm upgrade --install metrics-server bitnami/metrics-server --create-namespace --namespace metrics-server --set apiService.create=true --set extraArgs.kubelet-insecure-tls=true --set extraArgs.kubelet-preferred-address-types=InternalIP

## Create the deployment

    kubectl apply -f deploy.yaml

    kubectl get pods

## Set the autoscaling limits

    kubectl autoscale deployment hpa-deployment --cpu-percent=50 --min=1 --max=10

Validate

    kubectl get hpa

## Deploy Busybox

    kubectl apply -f pod.yaml

## Connect to the BusyBox container

    kubectl exec mybox -it -- /bin/sh

## Increase load

Type this endless loop:

    while true; do wget -q -O- http://php-apache; done

Validate

    kubectl get hpa

## Launch K9s

In a separate terminal, launch K9s and see what’s happening.

## Stop the endless loop

Press **Ctrl-C** to terminate the loop and type **exit** to terminate the busybox.

## Delete the autoscaler

    kubectl delete hpa hpa-deployment

## Cleanup

    kubectl delete -f pod.yaml --grace-period=0 --force
    kubectl delete -f deploy.yaml
