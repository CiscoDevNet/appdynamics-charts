# AppDynamics Charts 

Welcome to the repository of Helm charts for deployments of AppDynamics agents.

## Get the repo

```
$ helm repo add  appdynamics-charts https://ciscodevnet.github.io/appdynamics-charts
```

## Machine Agent

AppDynamics Machine Agent offers application-centric server monitoring. It helps to proactively isolate and resolve application performance issues faster with actionable, correlated application-server metrics. 

* Install the chart:

```
helm install --namespace=appdynamics \
--set controller.accessKey=<controller-key> \ 
--set controller.host=<*.saas.appdynamics.com> \
--set controller.port=443 --set controller.ssl=true \
--set controller.accountName=<account-name> \
--set controller.globalAccountName=<global-account-name> \ 
--set analytics.eventEndpoint=https://analytics.api.appdynamics.com \
--set agent.netviz=true serverviz appdynamics-charts/machine-agent
```

For detailed list of configuration settings refer to the [chart documentation](https://ciscodevnet.github.io/appdynamics-charts/machine-agent/)

To remove the chart, run the following command:

```
$ helm del stable

```

## ClusterAgent

⚠️ Deprecation Notice
This is a notice for sunsetting this public facing repository containing AppDynamics Cluster Agent helm charts in Github.

This repository will be maintained till October 31st 2023, post which it will not be updated. After this date, the latest helm charts will be made available via the [Appdynamics production artifactory](https://appdynamics.jfrog.io/ui/repos/tree/HelmInfo/appdynamics-cloud-helmcharts/cluster-agent/) 

AppDynamics ClusterAgent provides insights into the health of Kubernetes and OpenShift clusters and helps differentiate application anomalies from issues with cluster configuration and performance.

* Install the chart:

```
helm install --namespace=appdynamics --set controller.dns=saas.appdynamics.com --set controller.port=443 --set controller.ssl=true --set controller.accountName=customer1 --set controller.accessKey=f37b760f-962a-4280-b8b3-e85dcc016967 k8s-agent appdynamics-charts/cluster-agent

```

For detailed list of configuration settings refer to the [chart documentation](https://ciscodevnet.github.io/appdynamics-charts/cluster-agent/)

To remove the chart, run the following command:

```
$ helm del stable

```

