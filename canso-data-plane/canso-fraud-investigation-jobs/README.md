## Parameters

### deployment configuration

| Name                               | Description                                               | Value                                                                     |
| ---------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------------------- |
| `deployment.image`                 | full image identifier                                     | `shaktimaanbot/canso-fraud-investigation-jobs:v0.0.1rc1-python-3.13-slim` |
| `deployment.imagePullPolicy`       | Image pull policy for the deployment                      | `Always`                                                                  |
| `deployment.replicas`              | Number of replicas for the canso-fraud-inv-job deployment | `1`                                                                       |
| `deployment.concurrencyPerReplica` | Number of concurrent jobs to process per replica          | `1`                                                                       |

### Resource limits configuration

| Name                      | Description                                         | Value    |
| ------------------------- | --------------------------------------------------- | -------- |
| `resources.limits.cpu`    | CPU limits for the canso-fraud-inv-job container    | `1000m`  |
| `resources.limits.memory` | Memory limits for the canso-fraud-inv-job container | `1024Mi` |

### Resource requests configuration

| Name                                      | Description                                                   | Value                                     |
| ----------------------------------------- | ------------------------------------------------------------- | ----------------------------------------- |
| `resources.requests.cpu`                  | CPU requests for the canso-fraud-inv-job container            | `500m`                                    |
| `resources.requests.memory`               | Memory requests for the canso-fraud-inv-job container         | `512Mi`                                   |
| `imagePullSecret.name`                    | Name of the Secret that will be created                       | `docker-secret-cred-canso-fraud-inv-jobs` |
| `imagePullSecret.key`                     | Specifik key inside the secret that will be created           | `.dockerconfigjson`                       |
| `imagePullSecret.cloudProviderSecretName` | Name of the secret from the cloudprovider (AWS / GCP / AZURE) | `canso-dockerhub-credentials`             |
| `imagePullSecret.cloudProviderSecretKey`  | Specific key inside the secret from cloud provider            | `dockerhub`                               |
