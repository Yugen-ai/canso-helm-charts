⚠️ **CAUTION: This chart is currently in development and not ready for production use.** ⚠️

This Helm chart deploys an AI agent service to Kubernetes. It is currently in an alpha state and may contain bugs or incomplete features. Use at your own risk in development and testing environments only.

## Parameters

### Image parameters

| Name               | Description                                                                              | Value          |
| ------------------ | ---------------------------------------------------------------------------------------- | -------------- |
| `image.repository` | Image repository                                                                         | `repo/image`   |
| `image.pullPolicy` | Image pull policy                                                                        | `IfNotPresent` |
| `image.tag`        | Image tag (immutable tags are recommended)                                               | `""`           |
| `nameOverride`     | String to partially override ai-agent.fullname template (will maintain the release name) | `""`           |
| `fullnameOverride` | String to fully override ai-agent.fullname template                                      | `""`           |

### Service parameters

| Name           | Description             | Value      |
| -------------- | ----------------------- | ---------- |
| `service.type` | Kubernetes Service type | `NodePort` |
| `service.port` | Service port            | `80`       |

### Autoscaling parameters

| Name                                                        | Description                                | Value         |
| ----------------------------------------------------------- | ------------------------------------------ | ------------- |
| `autoscaling.enabled`                                       | Enable autoscaling for ai-agent deployment | `true`        |
| `autoscaling.minReplicas`                                   | Minimum number of replicas to scale back   | `1`           |
| `autoscaling.maxReplicas`                                   | Maximum number of replicas to scale out    | `5`           |
| `autoscaling.metrics[0].type`                               | Type of metric to use for scaling          | `Resource`    |
| `autoscaling.metrics[0].resource.name`                      | Name of the resource to monitor            | `memory`      |
| `autoscaling.metrics[0].resource.target.type`               | Type of scaling target                     | `Utilization` |
| `autoscaling.metrics[0].resource.target.averageUtilization` | Target average utilization percentage      | `80`          |

### Resource Management

| Name                 | Description                                        | Value |
| -------------------- | -------------------------------------------------- | ----- |
| `resources.limits`   | The resources limits for the ai-agent container    | `{}`  |
| `resources.requests` | The requested resources for the ai-agent container | `{}`  |

### Liveness and Readiness Probes

| Name                                 | Description                              | Value   |
| ------------------------------------ | ---------------------------------------- | ------- |
| `livenessProbe.enabled`              | Enable livenessProbe                     | `false` |
| `livenessProbe.initialDelaySeconds`  | Initial delay seconds for livenessProbe  | `10`    |
| `livenessProbe.periodSeconds`        | Period seconds for livenessProbe         | `10`    |
| `livenessProbe.timeoutSeconds`       | Timeout seconds for livenessProbe        | `5`     |
| `livenessProbe.failureThreshold`     | Failure threshold for livenessProbe      | `3`     |
| `livenessProbe.successThreshold`     | Success threshold for livenessProbe      | `1`     |
| `readinessProbe.enabled`             | Enable readinessProbe                    | `false` |
| `readinessProbe.initialDelaySeconds` | Initial delay seconds for readinessProbe | `5`     |
| `readinessProbe.periodSeconds`       | Period seconds for readinessProbe        | `10`    |
| `readinessProbe.timeoutSeconds`      | Timeout seconds for readinessProbe       | `5`     |
| `readinessProbe.failureThreshold`    | Failure threshold for readinessProbe     | `3`     |
| `readinessProbe.successThreshold`    | Success threshold for readinessProbe     | `1`     |
