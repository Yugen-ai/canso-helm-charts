## Parameters

### spec

| Name                | Description              | Value                         |
| ------------------- | ------------------------ | ----------------------------- |
| `spec.service_name` | Service name             | `canso-workflow-orchestrator` |
| `spec.namespace`    | Namespace for deployment | `airflow`                     |
| `replicaCount`      | Number of replicas       | `1`                           |

### image

| Name               | Description                                                              | Value                                                                     |
| ------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------- |
| `image.repository` | Image repository                                                         | `shaktimaanbot/jerry-image-prod`                                          |
| `image.pullPolicy` | Image pull policy                                                        | `Always`                                                                  |
| `image.tag`        | Overrides the image tag/SHA digest whose default is the chart appVersion | `sha256:a79046ebf4b32ec501e988210c804307bfda51f4d25a708f02550dcb058da3f3` |

### external_secret

| Name                                     | Description                                        | Value                            |
| ---------------------------------------- | -------------------------------------------------- | -------------------------------- |
| `external_secret.enabled`                | Enable external secret                             | `true`                           |
| `external_secret.cluster_secret_role`    | Name of Cluster secret role created in the cluster | `secretstore-by-role`            |
| `external_secret.name`                   | The name of the secret that will be created        | `canso-workflow-orchestrator`    |
| `external_secret.target_secret_name`     | name of the target kubernetes secret               | `docker-secret-cred`             |
| `external_secret.target_secret_type`     | type of the target kubernetes secret               | `kubernetes.io/dockerconfigjson` |
| `external_secret.target_secret_name_key` | key of the kubernetes secret                       | `.dockerconfigjson`              |
| `external_secret.aws_secret_name`        | name of the AWS secret                             | `canso/dockerhub`                |
| `external_secret.aws_secret_key`         | key of the kubernetes secret                       | `dockerhub`                      |
| `nameOverride`                           | Override the name of the service                   | `canso-workflow-orchestrator`    |
| `fullnameOverride`                       | Override the full name of the service              | `""`                             |
| `podAnnotations`                         | Annotations to be added to the deploymetn pods     | `{}`                             |
| `persistentVolumeClaim.existingClaim`    | Write in existing PVC                              | `airflow-pvc`                    |
| `podSecurityContext`                     | Security context for the deployment pods           | `{}`                             |
| `securityContext`                        | Security context for the deployment pods           | `{}`                             |

### service

| Name           | Description                             | Value      |
| -------------- | --------------------------------------- | ---------- |
| `service.type` | Type of the service                     | `NodePort` |
| `service.port` | Port of the service                     | `3000`     |
| `ingress`      | Ingress configuration for the service   | `{}`       |
| `resources`    | Pod resource requests and limits        | `{}`       |
| `autoscaling`  | Horizontal pod autoscaler configuration | `{}`       |
| `nodeSelector` | Node labels for pod assignment          | `{}`       |
| `tolerations`  | Tolerations for pod assignment          | `[]`       |
| `affinity`     | Affinity for pod assignment             | `{}`       |
