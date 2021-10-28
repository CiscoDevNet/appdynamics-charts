# Appdynamics Helm Chart

### Add AppDynamics helm repo
```bash
helm repo add appdynamics-charts https://ciscodevnet.github.io/appdynamics-charts
```
### Create values yaml to override default ones
```yaml
installClusterAgent: true
installInfraViz: false

imageInfo:
  agentImage: docker.io/appdynamics/cluster-agent
  agentTag: 21.7.0
  operatorImage: docker.io/appdynamics/cluster-agent-operator
  operatorTag: 0.6.10
  imagePullPolicy: Always           # Will be used for operator pod
  machineAgentImage: docker.io/appdynamics/machine-agent-analytics
  machineAgentTag: 21.9.0
  machineAgentWinTag: 21.9.0-win-ltsc2019
  netVizImage: docker.io/appdynamics/machine-agent-netviz
  netvizTag: 21.3.0                             

controllerInfo:
  url: <controller-url>
  account: <controller-account>
  username: <controller-username>
  password: <controller-password>
  accessKey: <controller-accesskey>
  globalAccount: <controller-global-account>

agentServiceAccount: appdynamics-cluster-agent
operatorServiceAccount: appdynamics-operator
infravizServiceAccount: appdynamics-infraviz
```
### Install cluster agent or machine agent using helm chart
```bash
helm install cluster-agent appdynamics-charts/cluster-agent -f <values-file>.yaml --namespace appdynamics
```
### Note:
For more details and config options please visit official documentation
[https://docs.appdynamics.com/display/PRO45/Deploy+the+Cluster+Agent+with+Helm+Charts](https://docs.appdynamics.com/display/PRO45/Deploy+the+Cluster+Agent+with+Helm+Charts)
