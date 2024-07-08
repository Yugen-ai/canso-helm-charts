## Parameters

### airflowDeploySecret configuration

| Name                           | Description                                                | Value                  |
| ------------------------------ | ---------------------------------------------------------- | ---------------------- |
| `airflowDeploySecret.name`     | Name of the Secret. Strongly recommend to not change name. | `airflow-admin-secret` |
| `airflowDeploySecret.username` | Username for Airflow (used to login to Airflow's Web UI)   | `admin`                |
| `airflowDeploySecret.password` | Password for Airflow (used to login to Airflow's Web UI)   | `password`             |

### Default specifications for the deployment


### Canso Agent Configuration

| Name                 | Description                      | Value  |
| -------------------- | -------------------------------- | ------ |
| `cansoAgent.enabled` | Bool value to deploy Canso Agent | `true` |

### Service Account Configuration

| Name                                    | Description                                                           | Value  |
| --------------------------------------- | --------------------------------------------------------------------- | ------ |
| `cansoAgent.serviceAccount.create`      | Bool to enable serviceAccount creation                                | `true` |
| `cansoAgent.serviceAccount.annotations` | Annotations for the service account                                   | `{}`   |
| `cansoAgent.serviceAccount.name`        | Name of the serviceAccount to use. Automatically created from helpers | `""`   |

### Service Configuration

| Name                             | Description                                   | Value  |
| -------------------------------- | --------------------------------------------- | ------ |
| `cansoAgent.service.annotations` | Annotations to add to the canso-agent service | `{}`   |
| `cansoAgent.service.labels`      | Labels to add to the canso-agent service      | `{}`   |
| `cansoAgent.service.clusterIP`   | Cluster IP for canso-agent service            | `""`   |
| `cansoAgent.service.targetport`  | Target port for the service                   | `5001` |

### Secret Store Ref configurations

| Name                             | Description                                                                                                                   | Value                 |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| `cansoAgent.secretStoreRef.name` | Name of the Secret Store resource to fetch the ExternalSecret data                                                            | `secretstore-by-role` |
| `cansoAgent.secretStoreRef.kind` | Kind of the SecretStore resource (SecretStore or ClusterSecretStore). Strongly advised not to change the default value below. | `ClusterSecretStore`  |

### External secret configurations

| Name                                                | Description                                                                                       | Value                            |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------- | -------------------------------- |
| `cansoAgent.external_secret.enabled`                | Enable external secret                                                                            | `true`                           |
| `cansoAgent.external_secret.name`                   | The name of the secret that will be created                                                       | `docker-secret-cred-dev-agent`   |
| `cansoAgent.external_secret.target_secret_name`     | The name of the secret stored in AWS Secrets Manager                                              | `docker-secret-cred-dev-agent`   |
| `cansoAgent.external_secret.target_secret_type`     | The type of the secret stored in the external secrets store                                       | `kubernetes.io/dockerconfigjson` |
| `cansoAgent.external_secret.target_secret_name_key` | The key within the secret in the external secrets store that holds the Docker configuration JSON. | `.dockerconfigjson`              |
| `cansoAgent.external_secret.aws_secret_name`        | The path to the secret in AWS Secrets Manager that contains the Docker credentials                | `stage/dockerhub`                |
| `cansoAgent.external_secret.aws_secret_key`         | The key within the secret in AWS Secrets Manager that contains the Docker credentials.            | `dockerhub`                      |

### Readiness Probe Configurations

| Name                                            | Description                                                                             | Value     |
| ----------------------------------------------- | --------------------------------------------------------------------------------------- | --------- |
| `cansoAgent.readinessProbe.enabled`             | Specifies if the readiness probe is enabled                                             | `false`   |
| `cansoAgent.readinessProbe.initialDelaySeconds` | Number of seconds after the container has started before readiness probes are initiated | `120`     |
| `cansoAgent.readinessProbe.periodSeconds`       | How often to perform the probe                                                          | `10`      |
| `cansoAgent.readinessProbe.timeoutSeconds`      | Number of seconds after which the probe times out                                       | `20`      |
| `cansoAgent.readinessProbe.successThreshold`    | Success threshold for readiness probe                                                   | `1`       |
| `cansoAgent.readinessProbe.failureThreshold`    | Minimum consecutive failures for the probe to be considered failed                      | `6`       |
| `cansoAgent.readinessProbe.path`                | The path for the readiness probe                                                        | `/health` |
| `cansoAgent.readinessProbe.port`                | The port to use for the probe                                                           | `http`    |

### Liveness Probe Configurations

| Name                                           | Description                                                                            | Value     |
| ---------------------------------------------- | -------------------------------------------------------------------------------------- | --------- |
| `cansoAgent.livenessProbe.enabled`             | Specifies if the liveness probe is enabled                                             | `false`   |
| `cansoAgent.livenessProbe.initialDelaySeconds` | Number of seconds after the container has started before liveness probes are initiated | `120`     |
| `cansoAgent.livenessProbe.periodSeconds`       | How often to perform the probe                                                         | `10`      |
| `cansoAgent.livenessProbe.timeoutSeconds`      | Number of seconds after which the probe times out                                      | `20`      |
| `cansoAgent.livenessProbe.successThreshold`    | Success threshold for liveness probe                                                   | `1`       |
| `cansoAgent.livenessProbe.failureThreshold`    | Minimum consecutive failures for the probe to be considered failed                     | `6`       |
| `cansoAgent.livenessProbe.path`                | The path for the liveness probe                                                        | `/health` |
| `cansoAgent.livenessProbe.port`                | The port to use for the probe                                                          | `http`    |

### Deployment Configurations


### Image Configuration  

| Name                                     | Description               | Value                           |
| ---------------------------------------- | ------------------------- | ------------------------------- |
| `cansoAgent.deployment.image.repository` | repository for the image  | `shaktimaanbot/dev-agent-image` |
| `cansoAgent.deployment.image.pullPolicy` | Pull policy for the image | `Always`                        |
| `cansoAgent.deployment.image.tag`        | Tag for the image         | `v0.0.1-python-3.8-slim`        |

### resources configuration


### resources limits configuration

| Name                                                       | Description                                                                                 | Value   |
| ---------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------- |
| `cansoAgent.deployment.resources.limits.cpu`               | CPU limits for the Canso Agent container. Strongly recommend to not decrease.               | `800m`  |
| `cansoAgent.deployment.resources.limits.memory`            | Memory limits for the Canso Agent container. Strongly recommend to not decrease.            | `512Mi` |
| `cansoAgent.deployment.resources.limits.ephemeral-storage` | Ephemeral storage limits for the Canso Agent container. Strongly recommend to not decrease. | `512Mi` |

### resources requests configuration

| Name                                                         | Description                                                                                   | Value   |
| ------------------------------------------------------------ | --------------------------------------------------------------------------------------------- | ------- |
| `cansoAgent.deployment.resources.requests.cpu`               | CPU requests for the Canso Agent container. Strongly recommend to not decrease.               | `500m`  |
| `cansoAgent.deployment.resources.requests.memory`            | Memory requests for the Canso Agent container. Strongly recommend to not decrease.            | `256Mi` |
| `cansoAgent.deployment.resources.requests.ephemeral-storage` | Ephemeral storage requests for the Canso Agent container. Strongly recommend to not decrease. | `256Mi` |
| `cansoAgent.deployment.enableEnv`                            | Whether environment variables are enabled                                                     | `true`  |
| `cansoAgent.deployment.enableEnvSecrets`                     | Whether environment secrets are enabled                                                       | `false` |

### Autoscaling Configuration

| Name                             | Description                                          | Value                     |
| -------------------------------- | ---------------------------------------------------- | ------------------------- |
| `cansoAgent.autoscaling.enabled` | autoscaling is enabled                               | `false`                   |
| `cansoAgent.tolerations`         | Taints that pod can tolerate                         | `[]`                      |
| `cansoAgent.affinity`            | Affinity rules for pod scheduling on a node          | `{}`                      |
| `cansoAgent.nodeSelector`        | Parameters to select for scheduling of pod on a node | `{}`                      |
| `cansoAgent.priorityClassName`   | PriorityClass name for the pod                       | `system-cluster-critical` |
| `cansoAgent.extraVolumes`        | Extra volume for the agent's container               | `[]`                      |
| `cansoAgent.extraVolumeMounts`   | Extra volume mount the agent's container             | `[]`                      |

### Cluster Role Binding

| Name                                    | Description                             | Value  |
| --------------------------------------- | --------------------------------------- | ------ |
| `cansoAgent.clusterRoleBinding.enabled` | Whether cluster role binding is enabled | `true` |

### Cluster Role

| Name                             | Description                                                    | Value         |
| -------------------------------- | -------------------------------------------------------------- | ------------- |
| `cansoAgent.clusterRole.enabled` | Whether cluster role is enabled                                | `true`        |
| `nameOverride`                   | String to override partial name passed in helm install command | `""`          |
| `fullnameOverride`               | String to override full name passed in helm install command    | `canso-agent` |
