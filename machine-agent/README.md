# Machine Agent Chart

AppDynamics is an application intelligence platform that provides end-to-end visibility into performance of business-critical applications.
This chart deploys AppDynamics MachineAgent Daemonset to the cluster.

## Prerequisites

* Kubernetes 1.7+ OpenShift 3.7+
* Helm and tiller installed in the cluster with the appropriate RBAC settings
* An AppDynamics account. AppDynamics offers a [free trial](https://www.appdynamics.com/free-trial/)

## Quick start

* Get the repo:

```
$ helm repo add  appdynamics-charts https://appdynamics.github.io/appdynamics-chart

$ helm repo update

```

* Install the chart on Kubernetes

```
helm install --namespace=appdynamics \
--set controller.accessKey=<controller-key> --set controller.host=<*.saas.appdynamics.com> \
--set controller.port=443 --set controller.ssl=true \
--set controller.accountName=<account-name> --set controller.globalAccountName=<global-account-name> \
--set analytics.eventEndpoint=https://analytics.api.appdynamics.com --set agent.netviz=true serverviz appdynamics-charts/machine-agent
```

* Install the chart on OpenShift

```
helm install ./machine-agent --name=stable --namespace=appdynamics \
--set controller.accessKey=<controller-key> --set controller.host=<*.saas.appdynamics.com> \
--set controller.port=443 --set controller.ssl=true --set controller.accountName=<account-name> \
--set controller.globalAccountName=<global-account-name> \
--set analytics.eventEndpoint=https://analytics.api.appdynamics.com \
--set openshift.scc=true --set agent.netviz=true

```

## Configuration settings

| Parameter                 | Description                                                  | Default                    |
| ------------------------- | ------------------------------------------------------------ | -------------------------- |
| `controller.host`                 | Host name of AppDynamics controller                 |                          |
| `controller.port`              | Appdynamics Controller port number | `443`|
| `controller.ssl`                  | Use ssl to connect to AppDynamics controller                |   `true`                      |
| `controller.accountName`     | AppDynamics account name | customer1
| `controller.globalAccountName` | AppDynamics global account name | |
| `controller.accessKey`             | Access key to the AppDynamics controller                             |                     |
| `agent.simEnabled`         | Infrastructure monitoring enabled                          | `true`                    |
| `agent.dockerEnabled`             | Container monitoring enabled                                       | `true`  |
| `agent.includeMasters`             | Deploy agent to master nodes. The flag has no effect in managed cloud environments                                       | `true`  |
| `agent.logLevel`        | Agent logging level                                             | `info`             |
| `agent.stdoutLogging`               | Send logging to console                        | `false`            |
| `agent.hierarchyPath`               | Path of host names in AppDynamics controller                 |      |
| `agent.uniqueHostId`              | Unique host id override                   |                  |
| `agent.metricsLimit`            | Max number of metrics accepted by the controller from the agent                             | `4000`                      |
| `agent.proxyHost`             | Proxy host name |                      |
| `agent.proxyPort`          | Proxy host port |            |
| `agent.proxyUser`             | Proxy username               |         
| `agent.proxyPass`             | Proxy password                  |
| `agent.enableContainerAsHostID` | Controls the value of the `Dappdynamics.docker.container.containerIdAsHostId.enabled` parameter of the machine agent | `false` |
| `agent.netviz` | Include network visibility agent | `false` |
| `netvizPort` | Host port number for the network visibility agent | 3892 |
| `netvizImage.image.repository` | Name of the network agent image | `docker.io/appdynamics/machine-agent-netviz`
| `netvizImage.image.tag` | Tag of the network agent image | `latest`
| `netvizImage.image.pullPolicy` | The network agent image pull policy| `Always`
| `analytics.eventEndpoint`     | Analytics service endpoint   | `https://analytics.api.appdynamics.com/`
| `analytics.port`             | Analytics service port       | 
| `serviceAccount.create`       | Flag indicating that the service account will be created | `true`
| `serviceAccount.name`       | Service account name.   | appdynamics-infraviz
| `rbac.create`            | Flag indicating that the roles for the service account will be created | `true`
| `openshift.scc`    | Creates scc for the service account on OpenShift. Set to `false` for all other Kubernetes distributions | `true`
| `daemonset.image.repository` | Name of the machine agent image | `docker.io/appdynamics/machine-agent-analytics`
| `daemonset.image.tag` | Tag of the machine agent image | `latest`
| `daemonset.image.pullPolicy` | The machine agent image pull policy| `Always`
| `daemonset.nodeSelector` | Node selector directive |
| `daemonset.tolerations ` | Tolerations directive |
| `daemonset.resources ` | Resources directive  | See below
| `daemonset.priorityClassName ` | Priority class reference, e.g. system-node-critical.  | Optional. When set to `system-node-critical` the chart must be deployed to `kube-system` namespace


Example resource limits:

```
   resources:
    limits:
      cpu: 600m
      memory: "1G"
    requests: 
      cpu: 300m
      memory: "800M"
```



 
