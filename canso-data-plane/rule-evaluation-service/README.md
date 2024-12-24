## Parameters

### spec

| Name                | Description                           | Value                     |
| ------------------- | ------------------------------------- | ------------------------- |
| `spec.service_name` | Name of the service to be deployed    | `rule-evaluation-service` |
| `nameOverride`      | Override the name of the service      | `rule-evaluation-service` |
| `fullnameOverride`  | Override the full name of the service | `rule-evaluation-service` |

### Override the deployment namespace

| Name                | Description                                          | Value             |
| ------------------- | ---------------------------------------------------- | ----------------- |
| `namespaceOverride` | Override for the all helm components for deployment. | `rule-evaluation` |

### External Secrets Config

| Name                                     | Description                                                                                       | Value                            |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------- | -------------------------------- |
| `external_secret.enabled`                | Enable the creation of the secret                                                                 | `true`                           |
| `external_secret.name`                   | The name of the secret that will be created                                                       | `rule-evaluation-service`        |
| `external_secret.cluster_secret_role`    | The name of the cluster secret role creted in the cluster                                         | `rule-evaluation-secret`         |
| `external_secret.target_secret_name`     | The name of the secret that will be created                                                       | `docker-secret-cred`             |
| `external_secret.target_secret_type`     | The type of the secret that will be created                                                       | `kubernetes.io/dockerconfigjson` |
| `external_secret.target_secret_name_key` | The key within the secret in the external secrets store that holds the Docker configuration JSON. | `.dockerconfigjson`              |
| `external_secret.aws_secret_name`        | The path to the secret in AWS Secrets Manager that contains the Docker credentials                | `canso/dockerhub`                |
| `external_secret.aws_secret_key`         | The key within the secret in AWS Secrets Manager that contains the Docker credentials.            | `dockerhub`                      |

### Deployment 

| Name                                                  | Description                                        | Value                |
| ----------------------------------------------------- | -------------------------------------------------- | -------------------- |
| `deployment.ImagePullSecrets.enabled`                 | Enable the creation of the secret                  | `true`               |
| `deployment.ImagePullSecrets.private_registry_secret` | The name of the secret created by external secrets | `docker-secret-cred` |
| `deployment.replicaCount`                             | Number of replicas to deploy                       | `1`                  |

### deployment.image 

| Name                          | Description                                                    | Value                                   |
| ----------------------------- | -------------------------------------------------------------- | --------------------------------------- |
| `deployment.image.repository` | The image repository                                           | `shaktimaanbot/rule-evaluation-service` |
| `deployment.image.pullPolicy` | Image pull policy                                              | `IfNotPresent`                          |
| `deployment.image.tag`        | Overrides the image tag whose default is the chart appVersion. | `""`                                    |
| `deployment.enableEnv`        | Enable the environment variables                               | `false`                                 |
| `deployment.enableEnvSecrets` | Enable the environment variables from secrets                  | `false`                                 |

### autoscaling 

| Name                  | Description                     | Value   |
| --------------------- | ------------------------------- | ------- |
| `autoscaling.enabled` | enable autoscaling for the pods | `false` |

### taint 

| Name            | Description                     | Value   |
| --------------- | ------------------------------- | ------- |
| `taint.enabled` | enabletaint for deployment pods | `false` |

### Service

| Name                 | Description                     | Value                     |
| -------------------- | ------------------------------- | ------------------------- |
| `service.name`       | The name of the service         | `rule-evaluation-service` |
| `service.app`        | The app name for service labels | `rule-evaluation-service` |
| `service.targetport` | The target port for the service | `8080`                    |

### Ingress

| Name                       | Description                     | Value    |
| -------------------------- | ------------------------------- | -------- |
| `ingress.enabled`          | Enable the ingress              | `true`   |
| `ingress.host`             | The host for the ingress        | `""`     |
| `ingress.path`             | The path for path based routing | `/`      |
| `ingress.pathType`         | The path type for the ingress   | `Prefix` |
| `ingress.ingressClassName` | The ingress class name          | `alb`    |
