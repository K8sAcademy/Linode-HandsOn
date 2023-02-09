# L40-LI-02

Let's deploy Prometheus and Grafana in our cluster.

## Metrics Server

Is the Metrics Server installed in your cluster?  Look for a namespace called **metrics-server** 

    kubectl get ns 

If not, install the Metrics Server using the Bitnami Helm chart.

    helm repo add bitnami https://charts.bitnami.com/bitnami
    helm repo update
    helm upgrade --install metrics-server bitnami/metrics-server --create-namespace --namespace metrics-server --set apiService.create=true --set extraArgs.kubelet-insecure-tls=true --set extraArgs.kubelet-preferred-address-types=InternalIP

## Prometheus Stack

Let's deploy Prometheus and Grafana using the Prometheus Stack Helm chart provided here:

    https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack

## Update Helm

    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    helm repo update

## Install Prometheus stack

Install Prometheus in the **monitoring namespace**.

    kubectl create namespace monitoring

    helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring

## Validate that all pods the monitoring pods are running

    kubectl -n monitoring get pods     

## Create the deployment

    kubectl apply -f deploy.yaml


## Set the autoscaling limits

    kubectl autoscale deployment hpa-deployment --cpu-percent=25 --min=1 --max=20

## Port-forward

    kubectl port-forward service/hpa-svc 8080:8080   

## Launch a browser

Launch the Kuard Web app using the IP address you got earlier.

Click on Keygen Workload, check the Enabled checkbox and click on Submit.

![image](https://kubernetesacademy.online/wp-content/uploads/2021/08/L40-02-01.png)

## View the Grafana dashboard

    kubectl --namespace monitoring port-forward $(kubectl get pods --namespace monitoring -l "app.kubernetes.io/name=grafana" -o jsonpath="{.items[0].metadata.name}") 8081:3000

Username: admin
Password: prom-operator

## Open a Grafana dashboard

Click on the **dashboard icon** and select **Manage**.

Select **Nodes**.

You should see some metrics for the nodes.

## Delete the autoscaler

    kubectl delete hpa hpa-deployment

## Cleanup

    kubectl delete -f deploy.yaml

## Uninstall the Prometheus stack

Delete Prometheus

    helm uninstall prometheus -n monitoring

The CRDs are not deleted by the Helm chart.  Delete them manually.

    kubectl delete crd alertmanagerconfigs.monitoring.coreos.com
    kubectl delete crd alertmanagers.monitoring.coreos.com
    kubectl delete crd podmonitors.monitoring.coreos.com
    kubectl delete crd probes.monitoring.coreos.com
    kubectl delete crd prometheuses.monitoring.coreos.com
    kubectl delete crd prometheusrules.monitoring.coreos.com
    kubectl delete crd servicemonitors.monitoring.coreos.com
    kubectl delete crd thanosrulers.monitoring.coreos.com
