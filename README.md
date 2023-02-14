# IRS

## HELM

Initiate the helm repositories

``` bash

helm repo add bitnami https://charts.bitnami.com/bitnami

```

Build and update helm charts

``` bash
helm dependency build; helm dependency update
```

Install the helm chart

``` bash
helm install omejdn-service --namespace omejdn --create-namespace .
```

Uninstall the helm chart

``` bash
helm uninstall omejdn-service --namespace omejdn
```

## OMEJDN

``` bash
kubectl port-forward svc/omejdn-service 4567:4567
```
