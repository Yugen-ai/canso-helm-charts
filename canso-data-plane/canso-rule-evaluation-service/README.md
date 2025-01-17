## Parameters

### spec

| Name                | Description                           | Value                           |
| ------------------- | ------------------------------------- | ------------------------------- |
| `spec.service_name` | Name of the service to be deployed    | `canso-rule-evaluation-service` |
| `nameOverride`      | Override the name of the service      | `canso-rule-evaluation-service` |
| `fullnameOverride`  | Override the full name of the service | `canso-rule-evaluation-service` |

### Override the deployment namespace

| Name                | Description                                          | Value             |
| ------------------- | ---------------------------------------------------- | ----------------- |
| `namespaceOverride` | Override for the all helm components for deployment. | `rule-evaluation` |

### External Secrets Config

| Name                                     | Description                                                                                       | Value                            |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------- | -------------------------------- |
| `external_secret.enabled`                | Enable the creation of the secret                                                                 | `true`                           |
| `external_secret.name`                   | The name of the secret that will be created                                                       | `canso-rule-evaluation-service`  |
| `external_secret.cluster_secret_role`    | The name of the cluster secret role creted in the cluster                                         | `secretstore-by-role`            |
| `external_secret.target_secret_name`     | The name of the secret that will be created                                                       | `docker-secret-cred`             |
| `external_secret.target_secret_type`     | The type of the secret that will be created                                                       | `kubernetes.io/dockerconfigjson` |
| `external_secret.target_secret_name_key` | The key within the secret in the external secrets store that holds the Docker configuration JSON. | `.dockerconfigjson`              |
| `external_secret.aws_secret_name`        | The path to the secret in AWS Secrets Manager that contains the Docker credentials                | `canso-dockerhub-credentials`    |
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
| `deployment.enableEnv`        | Enable the environment variables                               | `true`                                  |
| `deployment.env`              | The environment variables                                      | `[]`                                    |
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

| Name                 | Description                     | Value                           |
| -------------------- | ------------------------------- | ------------------------------- |
| `service.name`       | The name of the service         | `canso-rule-evaluation-service` |
| `service.app`        | The app name for service labels | `canso-rule-evaluation-service` |
| `service.targetport` | The target port for the service | `8000`                          |

### Redis

| Name            | Description      | Value  |
| --------------- | ---------------- | ------ |
| `redis.enabled` | Enable the redis | `true` |

### redis.initJob

| Name                        | Description                   | Value  |
| --------------------------- | ----------------------------- | ------ |
| `redis.initJob.enabled`     | Enable the initialization job | `true` |
| `redis.initJob.workflowKey` | The workflow key              | `""`   |
| `redis.initJob.ruleEntries` | The rule entries              | `{}`   |

### redis.persistence

| Name                             | Description                                          | Value               |
| -------------------------------- | ---------------------------------------------------- | ------------------- |
| `redis.persistence.enabled`      | Enable persistence for redis instance                | `false`             |
| `redis.persistence.storageClass` | Specify the storage class or leave blank for default | `""`                |
| `redis.persistence.size`         | Size of the PersistentVolumeClaim                    | `1Gi`               |
| `redis.persistence.accessModes`  | Define access modes                                  | `["ReadWriteOnce"]` |

### redis.image 

| Name                     | Description                                                    | Value          |
| ------------------------ | -------------------------------------------------------------- | -------------- |
| `redis.image.repository` | The image repository                                           | `redis`        |
| `redis.image.tag`        | Overrides the image tag whose default is the chart appVersion. | `7.4.2`        |
| `redis.image.pullPolicy` | Image pull policy                                              | `IfNotPresent` |

### redis.auth 

| Name                  | Description            | Value   |
| --------------------- | ---------------------- | ------- |
| `redis.auth.enabled`  | Enable the redis auth  | `false` |
| `redis.auth.password` | password of redis auth | `""`    |

### Ingress

| Name                       | Description                     | Value      |
| -------------------------- | ------------------------------- | ---------- |
| `ingress.enabled`          | Enable the ingress              | `true`     |
| `ingress.host`             | The host for the ingress        | `*.com`    |
| `ingress.path`             | The path for path based routing | `/v1/risk` |
| `ingress.pathType`         | The path type for the ingress   | `Prefix`   |
| `ingress.ingressClassName` | The ingress class name          | `nginx`    |
