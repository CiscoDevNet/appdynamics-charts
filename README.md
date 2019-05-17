# AppDynamics Charts
Welcome to the repository of Helm charts for deployments of AppDynamics agents.

## Get the repo

```
$ helm repo add  appdynamics-charts https://appdynamics.github.io/appdynamics-charts
```

## Machine Agent

* Install the chart:

```
$ helm install appdynamics-charts/machine-agent --name=stable \
--set controller.accessKey=5a8a4d47-78a8-40d6-8b07-1a4f90c51789 \
--set controller.host=tenant.saas.appdynamics.com
--set controller.accountName=<accountName>
--set controller.globalAccountName=<globalAccountName>

```

For detailed list of configuration settings refer to the [chart documentation](https://appdynamics.github.io/appdynamics-charts/machine-agent/)

To remove the chart, run the following command:

```
$ helm del --purge stable

```

## ClusterAgent

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

