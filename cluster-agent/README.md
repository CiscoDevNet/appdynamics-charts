# Cluster Agent Helm Chart

### Add AppDynamics helm repo
```bash
helm repo add appdynamics-charts https://appdynamics.github.io/appdynamics-charts
```
### Create values yaml to override default ones
```yaml
imageInfo:
  agentImage: docker.io/appdynamics/cluster-agent
  agentTag: 20.7.0
  operatorImage: docker.io/appdynamics/cluster-agent-operator
  operatorTag: latest
  imagePullPolicy: Always                             

controllerInfo:
  url: <controller-url>
  account: <controller-account>
  username: <controller-username>
  password: <controller-password>
  accessKey: <controller-accesskey>

agentServiceAccount: appdynamics-cluster-agent
operatorServiceAccount: appdynamics-operator
```
### Install cluster agent using helm chart
```bash
helm install cluster-agent appdynamics-charts/cluster-agent -f <values-file>.yaml --namespace appdynamics
```
### Note:
For more details and config options please visit official documentation
[https://docs.appdynamics.com/display/PRO45/Deploy+the+Cluster+Agent+with+Helm+Charts](https://docs.appdynamics.com/display/PRO45/Deploy+the+Cluster+Agent+with+Helm+Charts)
