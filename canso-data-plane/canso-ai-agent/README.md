⚠️ **CAUTION: This chart is currently in development and not ready for production use.** ⚠️

This Helm chart deploys an AI agent service to Kubernetes. It is currently in an alpha state and may contain bugs or incomplete features. Use at your own risk in development and testing environments only.

## Parameters

### Service parameters

| Name           | Description             | Value      |
| -------------- | ----------------------- | ---------- |
| `service.type` | Kubernetes Service type | `NodePort` |
| `service.port` | Service port            | `8080`     |

### Autoscaling parameters

| Name                                            | Description                                      | Value  |
| ----------------------------------------------- | ------------------------------------------------ | ------ |
| `autoscaling.enabled`                           | Enable autoscaling for ai-agent deployment       | `true` |
| `autoscaling.minReplicas`                       | Minimum number of replicas to scale back         | `1`    |
| `autoscaling.maxReplicas`                       | Maximum number of replicas to scale out          | `5`    |
| `autoscaling.targetCPUUtilizationPercentage`    | Target CPU utilization percentage                | `80`   |
| `autoscaling.targetMemoryUtilizationPercentage` | Target memory utilization percentage             | `80`   |
| `autoscaling.customMetrics`                     | Additional custom metrics for scaling (optional) | `[]`   |

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

### Service Account parameters

| Name                         | Description                                              | Value   |
| ---------------------------- | -------------------------------------------------------- | ------- |
| `serviceAccount.annotations` | Additional custom annotations for the ServiceAccount     | `{}`    |
| `serviceAccount.aws.enabled` | Enable AWS IAM role                                      | `false` |
| `serviceAccount.aws.roleArn` | ARN of the IAM role to associate with the ServiceAccount | `""`    |
