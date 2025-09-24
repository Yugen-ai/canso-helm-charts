## Parameters

### deployment configuration

| Name                         | Description                                               | Value    |
| ---------------------------- | --------------------------------------------------------- | -------- |
| `deployment.image`           | full image identifier                                     | `""`     |
| `deployment.imagePullPolicy` | Image pull policy for the deployment                      | `Always` |
| `deployment.replicas`        | Number of replicas for the canso-fraud-inv-job deployment | `1`      |

### serviceAccount Image pull secrets

| Name                         | Description                                             | Value  |
| ---------------------------- | ------------------------------------------------------- | ------ |
| `serviceAccount.create`      | Specifies whether a service account should be created   | `true` |
| `serviceAccount.automount`   | Automatically mount a ServiceAccount's API credentials? | `true` |
| `serviceAccount.annotations` | Annotations to add to the service account               | `{}`   |
| `serviceAccount.name`        | SA Name                                                 | `""`   |
| `podAnnotations`             | POD Annotations                                         | `{}`   |
| `podLabels`                  | POD Labels                                              | `{}`   |

### service Service Configuration

| Name           | Description                                          | Value       |
| -------------- | ---------------------------------------------------- | ----------- |
| `service.type` | Service Type (ClusterIP, NodePort, and LoadBalancer) | `ClusterIP` |
| `service.port` | Port used by clients to access the service           | `8000`      |

### resources Resource Configuration


### resources.request Resource request Configuration

| Name                        | Description                           | Value   |
| --------------------------- | ------------------------------------- | ------- |
| `resources.requests.cpu`    | Resource request  cpu Configuration   | `400m`  |
| `resources.requests.memory` | Resource request memory Configuration | `384Mi` |

### resources.limits Resource limits Configuration

| Name                      | Description                          | Value   |
| ------------------------- | ------------------------------------ | ------- |
| `resources.limits.cpu`    | Resource limits cpu Configuration    | `750m`  |
| `resources.limits.memory` | Resource limits memory Configuration | `768Mi` |

### Liveness Probe Configurations

| Name                                | Description                                                                            | Value        |
| ----------------------------------- | -------------------------------------------------------------------------------------- | ------------ |
| `livenessProbe.enabled`             | Specifies if the liveness probe is enabled                                             | `true`       |
| `livenessProbe.enabled`             | Specifies if the liveness probe is enabled                                             | `true`       |
| `livenessProbe.initialDelaySeconds` | Number of seconds after the container has started before liveness probes are initiated | `30`         |
| `livenessProbe.periodSeconds`       | How often to perform the probe                                                         | `10`         |
| `livenessProbe.timeoutSeconds`      | Number of seconds after which the probe times out                                      | `20`         |
| `livenessProbe.successThreshold`    | Success threshold for liveness probe                                                   | `1`          |
| `livenessProbe.failureThreshold`    | Minimum consecutive failures for the probe to be considered failed                     | `3`          |
| `livenessProbe.path`                | The path for the liveness probe                                                        | `/v1/health` |
| `livenessProbe.port`                | The port to use for the probe                                                          | `http`       |

### Readiness Probe Configurations

| Name                                            | Description                                                                             | Value        |
| ----------------------------------------------- | --------------------------------------------------------------------------------------- | ------------ |
| `readinessProbe.enabled`                        | Specifies if the readiness probe is enabled                                             | `true`       |
| `readinessProbe.initialDelaySeconds`            | Number of seconds after the container has started before readiness probes are initiated | `30`         |
| `readinessProbe.periodSeconds`                  | How often to perform the probe                                                          | `10`         |
| `readinessProbe.timeoutSeconds`                 | Number of seconds after which the probe times out                                       | `20`         |
| `readinessProbe.successThreshold`               | Success threshold for readiness probe                                                   | `1`          |
| `readinessProbe.failureThreshold`               | Minimum consecutive failures for the probe to be considered failed                      | `6`          |
| `readinessProbe.path`                           | The path for the readiness probe                                                        | `/v1/health` |
| `readinessProbe.port`                           | The port to use for the probe                                                           | `http`       |
| `autoscaling.enabled`                           | Enable autoscaling                                                                      | `true`       |
| `autoscaling.minReplicas`                       | Minimum number of replicas                                                              | `1`          |
| `autoscaling.maxReplicas`                       | Minimum number of replicas                                                              | `5`          |
| `autoscaling.targetCPUUtilizationPercentage`    | Target CPU utilization percentage                                                       | `80`         |
| `autoscaling.targetMemoryUtilizationPercentage` | Target Memory utilization percentage                                                    | `90`         |

### Image Pull secret configuration

| Name                                      | Description                                                   | Value                                  |
| ----------------------------------------- | ------------------------------------------------------------- | -------------------------------------- |
| `imagePullSecret.name`                    | Name of the Secret that will be created                       | `docker-secret-cred-tenant-et-service` |
| `imagePullSecret.key`                     | Specific key inside the secret that will be created           | `.dockerconfigjson`                    |
| `imagePullSecret.cloudProviderSecretName` | Name of the secret from the cloudprovider (AWS / GCP / AZURE) | `canso-dockerhub-credentials`          |
| `imagePullSecret.cloudProviderSecretKey`  | Specific key inside the secret from cloud provider            | `dockerhub`                            |
