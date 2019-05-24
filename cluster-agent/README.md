# ClusterAgent Chart

AppDynamics is an application intelligence platform that provides end-to-end visibility into performance of business-critical applications.
This chart deploys AppDynamics ClusterAgent for monitoring Kubenetes and OpenShift cluster.

## Prerequisites

* Kubernetes 1.7+ OpenShift 3.7+
* Helm and tiller installed in the cluster with the appropriate RBAC settings
* Kubernetes [Metrics server](https://hub.helm.sh/charts/stable/metrics-server) installed
* An AppDynamics account.

### Create a secret
Secure and recommended approach to provide sensitive data like passwords is to generate a secret containing the sensitive data and providing the pre-created secret name during chart deployment.

You can provide an existing secret containing `api-user` if applicable `controller-key` and `event-key`.
The existing secret can be provided as a value to `existingSecret`.

If creating a secret, it is recommended to name the secret as `release-name`-`secret-name`. For example:  MyRelease-MySecret

This allows the secrets to be affiliated with the release, but not directly included with the release.
Use below command to create a secret:
```
kubectl create secret generic my-release-<secret_name> \
  --from-literal='api-user=XXXX' \
  --from-literal='controller-key=XXXX' \
  --from-literal='event-key=XXXX' \
  --namespace namespace_name
```

### Image Security Policies

If the cluster has image security policies enforced, cluster-agent docker images should be added to it.

```
apiVersion: securityenforcement.admission.cloud.ibm.com/v1beta1
kind: ClusterImagePolicy
metadata:
name: ibmcloud-default-cluster-image-policy
spec:
 repositories:
   - name: docker.io/appdynamics/cluster-agent:*
```

### Pod Security Policies
This chart requires container to run as root.
If choosing a non-default namespace, then please select PSP which allows containers to run as root.
Refer [Creating a custom pod security policy](https://www.ibm.com/support/knowledgecenter/SSBS6K_3.1.2/user_management/custom_psp.html) if creating a custom PSP.

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
| `agent.appName`               | Name of the ClusterAgent application in AppDynamics                       | `K8s-CLuster-Agent`            |
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
| `existingSecret` | Name of existing secret to use for ClusterAgent application in AppDyanamics   |

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
## Limitation
A fully functional AppDyanmics account is needed to install this chart. Lite Appdyanamics account is not currently supported.

## Support
AppDynamics has a wide variety of community and commercial support options available for users. Visit [AppDynamics Support Page](https://www.appdynamics.com/support/) for details.
