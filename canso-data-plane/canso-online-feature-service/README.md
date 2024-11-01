## Parameters

### spec

| Name                | Description                           | Value                          |
| ------------------- | ------------------------------------- | ------------------------------ |
| `spec.service_name` | Name of the service to be deployed    | `canso-online-fs`              |
| `nameOverride`      | Override the name of the service      | `canso-online-feature`         |
| `fullnameOverride`  | Override the full name of the service | `canso-online-feature-service` |

### External Secrets Config

| Name                                     | Description                                                                                       | Value                            |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------- | -------------------------------- |
| `external_secret.enabled`                | Enable the creation of the secret                                                                 | `true`                           |
| `external_secret.name`                   | The name of the secret that will be created                                                       | `canso-online-fs`                |
| `external_secret.cluster_secret_role`    | The name of the cluster secret role creted in the cluster                                         | `secretstore-by-role`            |
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
| `deployment.replicaCount`                             | Number of replicas to deploy                       | `2`                  |

### deployment.image 

| Name                          | Description                                                    | Value                                                                     |
| ----------------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `deployment.image.repository` | The image repository                                           | `shaktimaanbot/feature-retrieval-server-prod`                             |
| `deployment.image.pullPolicy` | Image pull policy                                              | `IfNotPresent`                                                            |
| `deployment.image.tag`        | Overrides the image tag whose default is the chart appVersion. | `sha256:3bcbcf0dd673784e63f4b68548c976f915c22f046e3966d654484a6235a892fd` |
| `deployment.enableEnv`        | Enable the environment variables                               | `false`                                                                   |
| `deployment.enableEnvSecrets` | Enable the environment variables from secrets                  | `false`                                                                   |

### autoscaling 

| Name                  | Description                     | Value   |
| --------------------- | ------------------------------- | ------- |
| `autoscaling.enabled` | enable autoscaling for the pods | `false` |

### taint 

| Name            | Description                     | Value   |
| --------------- | ------------------------------- | ------- |
| `taint.enabled` | enabletaint for deployment pods | `false` |

### Service

| Name                 | Description                     | Value             |
| -------------------- | ------------------------------- | ----------------- |
| `service.name`       | The name of the service         | `canso-online-fs` |
| `service.app`        | The app name for service labels | `canso-online-fs` |
| `service.targetport` | The target port for the service | `8080`            |

### Ingress

| Name                       | Description                     | Value    |
| -------------------------- | ------------------------------- | -------- |
| `ingress.enabled`          | Enable the ingress              | `true`   |
| `ingress.host`             | The host for the ingress        | `""`     |
| `ingress.path`             | The path for path based routing | `/`      |
| `ingress.pathType`         | The path type for the ingress   | `Prefix` |
| `ingress.ingressClassName` | The ingress class name          | `alb`    |
