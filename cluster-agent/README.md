# ClusterAgent Chart

AppDynamics is an application intelligence platform that provides end-to-end visibility into performance of business-critical applications.
This chart deploys AppDynamics ClusterAgent for monitoring Kubenetes and OpenShift cluster.

## Prerequisites

* Kubernetes 1.7+ OpenShift 3.7+
* Helm and tiller installed in the cluster with the appropriate RBAC settings
* Kubernetes [Metrics server](https://hub.helm.sh/charts/stable/metrics-server) installed
* An AppDynamics account. AppDynamics offers a [free trial](https://www.appdynamics.com/free-trial/)

## Quick start

* Get the repo:

```
$ helm repo add  appdynamics-charts https://appdynamics.github.io/appdynamics-chart

$ helm repo update

```

* Install the chart:

```
helm install appdynamics-charts/cluster-agent --name=stable \
--set controller.url=<AppDynamics controller URl> \
--set controller.apiUser=<user@account:password>

```

## Configuration settings

| Parameter                 | Description                                                  | Default                    |
| ------------------------- | ------------------------------------------------------------ | -------------------------- |
| `controller.url`                 | Url of AppDynamics controller                 |                          |
| `controller.accountName`     | AppDynamics account name | 
| `controller.globalAccountName` | AppDynamics global account name | |
| `controller.apiUser` | User account information for API access. See [this doc](https://github.com/Appdynamics/cluster-agent/blob/master/docs/rest-user-role.md) for details | |
| `controller.eventKey` | Event API key to publish custom events. Optional | |
| `controller.controllerKey`             | Access key to the AppDynamics controller. Optional                             |                     |
| `agent.metricsSyncInterval`         | Metrics update interval (sec)                       | `55`                    |
| `agent.snapshotSyncInterval`             | Snapshot update interval (sec)                                       | `15`  |
| `agent.logLevel`        | Agent logging level                                             | `info`             |
| `agent.appName`               | Name of the ClusterAgent application in AppDynamics                       | `K8s-Cluster-Agent`            |
| `agent.tierName`               | Path of host names in AppDynamics controller                 | `ClusterAgent`     |
| `agent.agentServerPort`              | ClusterAgent internal server port                   | `8989`               |
| `agent.proxyHost`             | Proxy host name |                      |
| `agent.proxyPort`          | Proxy host name |            |
| `agent.proxyUser`             | Proxy username               |         
| `agent.proxyPass`             | Proxy password                  |
| `analytics.eventEndpoint`     | Analytics service endpoint   | `https://analytics.api.appdynamics.com/` |
| `serviceAccount.create`       | Flag indicating that the service account will be created | `true`
| `serviceAccount.name`       | Service account name.   | `appdynamics-operator`
| `deployment.image.repository` | Name of the machine agent image | `docker.io/appdynamics/cluster-agent`
| `deployment.image.tag` | Tag of the machine agent image | `latest`
| `deployment.image.pullPolicy` | The machine agent image pull policy| `IfNotPresent`
| `deployment.resources ` | Resources directive  | See below


Example resource limits:

```
  resources:
    limits:
      cpu: 200m
      memory: "300M"
    requests: 
      cpu: 100m
      memory: "100M"
 ```



 
