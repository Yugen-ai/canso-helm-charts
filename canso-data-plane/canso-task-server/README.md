## Parameters

### Image Configuration

| Name                          | Description                            | Value                                    |
| ----------------------------- | -------------------------------------- | ---------------------------------------- |
| `deployment.image.repository` | Repository for the image               | `shaktimaanbot/canso-task-server:v0.0.1` |
| `deployment.image.imageSha`   | SHA256 hash of the image (optional)    | `""`                                     |
| `deployment.image.pullPolicy` | Image pull policy for the deployment   | `IfNotPresent`                           |
| `broker`                      | Connection URL for the message broker  | `redis://redis-master:6379/0`            |
| `serviceAccount.create`       | Bool to enable serviceAccount creation | `true`                                   |
| `serviceAccount.name`         | Name of the service account            | `task-server`                            |
| `serviceAccount.annotations`  | Annotations for the service account    | `{}`                                     |

### Resource limits configuration

| Name                      | Description                                 | Value    |
| ------------------------- | ------------------------------------------- | -------- |
| `resources.limits.cpu`    | CPU limits for the task-server container    | `1000m`  |
| `resources.limits.memory` | Memory limits for the task-server container | `1024Mi` |

### Resource requests configuration

| Name                                     | Description                                                                                      | Value                            |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------ | -------------------------------- |
| `resources.requests.cpu`                 | CPU requests for the task-server container                                                       | `500m`                           |
| `resources.requests.memory`              | Memory requests for the task-server container                                                    | `512Mi`                          |
| `external_secret.enabled`                | Enable external secret                                                                           | `true`                           |
| `external_secret.name`                   | The name of the secret that will be created                                                      | `docker-secret-cred-task-server` |
| `external_secret.target_secret_name`     | The name of the secret stored in AWS Secrets Manager                                             | `docker-secret-cred-task-server` |
| `external_secret.target_secret_type`     | The type of the secret stored in the external secrets store                                      | `kubernetes.io/dockerconfigjson` |
| `external_secret.target_secret_name_key` | The key within the secret in the external secrets store that holds the Docker configuration JSON | `.dockerconfigjson`              |
| `external_secret.aws_secret_name`        | The path to the secret in AWS Secrets Manager that contains the Docker credentials               | `canso/dockerhub`                |
| `external_secret.aws_secret_key`         | The key within the secret in AWS Secrets Manager that contains the Docker credentials            | `dockerhub`                      |
| `secretStoreRef.name`                    | Name of the Secret Store resource to fetch the ExternalSecret data                               | `secretstore-by-role`            |
| `secretStoreRef.kind`                    | Kind of the SecretStore resource (SecretStore or ClusterSecretStore)                             | `ClusterSecretStore`             |
