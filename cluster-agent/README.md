# ClusterAgent Chart

AppDynamics is an application intelligence platform that provides end-to-end visibility into performance of business-critical applications.
This chart deploys AppDynamics ClusterAgent for monitoring Kubenetes and OpenShift cluster.

## Prerequisites

* Kubernetes 1.13+ OpenShift 3.10+
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
helm install --namespace=appdynamics --set controller.dns=saas.appdynamics.com --set controller.port=443 --set controller.ssl=true --set controller.accountName=customer1 --set controller.accessKey=f37b760f-962a-4280-b8b3-e85dcc016967 k8s-agent ./cluster-agent

```

## Configuration settings

| Parameter                 | Description                                                  | Default                    |
| ------------------------- | ------------------------------------------------------------ | -------------------------- |
| `controller.dns`                 | DNS of AppDynamics controller                 |                          |
| `controller.port` | Port DNS of the AppDynamics controller | |
| `controller.ssl` | True, if coominication to the AppDynamics controller is over SSL | |
| `controller.accountName`     | AppDynamics account name | 
| `controller.controllerKey`             | Access key to the AppDynamics controller. Optional  |  |                            
| `acontroller.proxyUrl`             | Proxy URL. Format: <protocol://dns:port |                      |
| `acontroller.proxyUser`             | Proxy User. Format: <username@password>               |   |
| `agent.logLevel`        | Agent logging level (INFO, DEBUG, WARN, TRACE)                                       | INFO             |
| `agent.appName`               | Name of the Cluster instance                      | `K8s-Cluster-Agent`            
| `agent.maxLogFileSize`               | Maximum size of the log file (MB)       | 5    
| `agent.maxLogBackups`               | Maximum number of backups       | 3    
| `agent.writeToStdout`               | Log output to console       |  true    
| `agent.containerRegInterval`               | Interval in seconds at which the Cluster Agent checks for containers and registers them with the Controller. You should only modify the default value if you want to discover running containers more frequently. The default value should be used in most environments.     | 120    
| `agent.eventUploadInterval`               |Interval in seconds at which Kubernetes warning and state-change events are uploaded to the Controller   | 10    
| `agent.httpClientTimeout`               | Number of seconds after which the server call is terminated if no response is received from the Controller     | 30
| `agent.metricsCollectionInterval`  | Interval in seconds between sending container metrics to the Controller   | "30"
| `agent.clusterMetricsCollectionInterval` | Interval in seconds between sending cluster-level metrics to the Controller| "60"
| `agent.metadataCollectionInterval`  | Interval in seconds at which metadata is collected for containers and pods     | "60"
| `agent.containerRegBatchSize`   | The Cluster Agent checks for containers and registers them with the Controller. This process is known as a container registration cycle. The containers are sent to the Controller in batches, and the containerBatchSize is the maximum number of containers per batch in one cycle.      | "5"          
| `agent.containerRegMaxParallelRequests`| Maximum number of parallel requests to the Controller for container registration | "1"
| `agent.podRegBatchSize`   | The Cluster Agent checks for pods and registers them with the Controller. This process is known as a pod registration cycle. The pods are sent to the Controller in batches, and the podBatchSize is the maximum number of pods per batch in one registration cycle.     | "6"
| `agent.metricUploadRetryCount`   | Number of times metric upload action to be attempted if unsuccessful the first time   | "2"
| `agent.metricUploadRetryInterval`   | Interval between consecutive metric upload retries, in milliseconds  | "5"
| `agent.containerFilter`   | Definitions of whitelisted/blacklisted names and blacklisted labels to filter | "blacklisted-label: {appdynamics.exclude: true}"
| `agent.monitoredNamespaces`       | List of namespaces to monitor   | `default`
| `serviceAccount.name`       | Service account name.   | `appdynamics-operator`
| `deployment.image.repository` | Name of the machine agent image | `docker.io/appdynamics/cluster-agent`
| `deployment.image.tag` | Tag of the machine agent image | `latest`
| `deployment.image.pullPolicy` | The machine agent image pull policy| `Always`
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



 
