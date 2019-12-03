# AppDynamics Charts 

Welcome to the repository of Helm charts for deployments of AppDynamics agents.

## Get the repo

```
$ helm repo add  appdynamics-charts https://appdynamics.github.io/appdynamics-charts
```

## Machine Agent

AppDynamics Machine Agent offers application-centric server monitoring. It helps to proactively isolate and resolve application performance issues faster with actionable, correlated application-server metrics. 

* Install the chart:

```
helm install ./machine-agent --name=stable --namespace=appdynamics \
--set controller.accessKey=<controller-key> \ 
--set controller.host=<*.saas.appdynamics.com> \
--set controller.port=443 --set controller.ssl=true \
--set controller.accountName=<account-name> \
--set controller.globalAccountName=<global-account-name> \ 
--set analytics.eventEndpoint=https://analytics.api.appdynamics.com \
--set agent.netviz=true
```

For detailed list of configuration settings refer to the [chart documentation](https://appdynamics.github.io/appdynamics-charts/machine-agent/)

To remove the chart, run the following command:

```
$ helm del --purge stable

```

## ClusterAgent

AppDynamics ClusterAgent provides insights into the health of Kubernetes and OpenShift clusters and helps differentiate application anomalies from issues with cluster configuration and performance.

* Install the chart:

```
helm install appdynamics-charts/cluster-agent --name=stable /
--set controller.url=<AppDynamics controller URl> /
--set controller.apiUser=<user@account:password> /

```

For detailed list of configuration settings refer to the [chart documentation](https://appdynamics.github.io/appdynamics-charts/cluster-agent/)

To remove the chart, run the following command:

```
$ helm del --purge stable

```

