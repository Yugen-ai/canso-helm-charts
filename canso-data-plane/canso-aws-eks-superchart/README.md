## Parameters

### ArgoCD Configs

| Name            | Description                | Value           |
| --------------- | -------------------------- | --------------- |
| `argocdProject` | ArgoCD project name.       | `canso-appsets` |
| `createProject` | Create the ArgoCD project. | `true`          |

### ArgoCD AI Agent Configs

| Name                   | Description                         | Value             |
| ---------------------- | ----------------------------------- | ----------------- |
| `argocdAIAgentProject` | ArgoCD AI Agent project name.       | `canso-ai-agents` |
| `createAIAgentProject` | Create the ArgoCD AI Agent project. | `true`            |

### ArgoCD Canso User Components Configs

| Name                           | Description                                 | Value                   |
| ------------------------------ | ------------------------------------------- | ----------------------- |
| `argocdCansoComponentsProject` | ArgoCD Canso Components project name.       | `canso-user-components` |
| `createComponentsProject`      | Create the ArgoCD Canso Components project. | `true`                  |

### Default Configs

| Name                 | Description                                       | Value                    |
| -------------------- | ------------------------------------------------- | ------------------------ |
| `clusterName`        | Name of the AWS EKS cluster.                      | `""`                     |
| `clusterEndpoint`    | Endpoint URL of the AWS EKS cluster.              | `""`                     |
| `tenantName`         | Name Assigned to the Tenant                       | `""`                     |
| `tenantID`           | Unique ID assigned to the Tenant                  | `""`                     |
| `awsRegion`          | AWS Region of the cluster                         | `""`                     |
| `encryption_enabled` | Enable Encryption                                 | `""`                     |
| `fernet_key`         | Fernet decryption for encrypted RabbitMQ messages | `""`                     |
| `queue_hostname`     | hostname for queue server                         | `rabbitmq-amqp.canso.ai` |
| `tolerations`        | Tolerations for the deployment.                   | `{}`                     |
| `affinity`           | Affinity for the deployment.                      | `{}`                     |

### Karpenter Configs

| Name                    | Description                  | Value  |
| ----------------------- | ---------------------------- | ------ |
| `karpenter.enabled`     | Flag to enable Karpenter.    | `true` |
| `karpenter.roleArn`     | Role ARN for Karpenter.      | `""`   |
| `karpenter.nodeRoleArn` | Role ARN for Karpenter node. | `""`   |

### StatsD Configs

| Name             | Description            | Value  |
| ---------------- | ---------------------- | ------ |
| `statsd.enabled` | Flag to enable StatsD. | `true` |

### Canso Image Pull Secrets


### Metrics Server Configuration

| Name                    | Description                   | Value  |
| ----------------------- | ----------------------------- | ------ |
| `metricsServer.enabled` | Flag to enable Metrics Server | `true` |

### AWS Configs

| Name                                    | Description                                 | Value  |
| --------------------------------------- | ------------------------------------------- | ------ |
| `aws.awsEbsCsiDriver.enabled`           | Flag to enable AWS EBS CSI Driver.          | `true` |
| `aws.awsEbsCsiDriver.roleArn`           | Role ARN for AWS EBS CSI Driver.            | `""`   |
| `aws.awsEfsCsiDriver.enabled`           | Flag to enable AWS EFS CSI Driver.          | `true` |
| `aws.awsEfsCsiDriver.roleArn`           | Role ARN for AWS EFS CSI Driver.            | `""`   |
| `aws.awsLoadBalancerController.enabled` | Flag to enable AWS Load Balancer Controller | `true` |
| `aws.awsLoadBalancerController.roleArn` | Role ARN for AWS Load Balancer Controller   | `""`   |
| `aws.awsACK.enabled`                    | Flag to enable AWS ACK                      | `true` |

### External Secrets

| Name                                        | Description                                        | Value                 |
| ------------------------------------------- | -------------------------------------------------- | --------------------- |
| `externalSecrets.enabled`                   | Flag to enable External Secrets                    | `true`                |
| `externalSecrets.serviceaccount.roleArn`    | arn Role ARN for External Secrets service account. | `""`                  |
| `externalSecrets.serviceaccount.name`       | Name of the service account for External Secrets.  | `external-secrets-sa` |
| `externalSecrets.clusterSecretStore.region` | AWS Region for AWS Secrets Manager.                | `""`                  |

### EFS Configs

| Name                            | Description                               | Value    |
| ------------------------------- | ----------------------------------------- | -------- |
| `efsStorageClass.enabled`       | Flag to enable EFS Storage Class.         | `true`   |
| `efsStorageClass.name`          | Name of the EFS Storage Class.            | `efs-sc` |
| `efsStorageClass.reclaimPolicy` | Reclaim policy for the EFS Storage Class. | `Retain` |
| `efsStorageClass.fileSystemId`  | File System ID for the EFS Storage Class. | `""`     |

### Priority Class Configurations

| Name                    | Description                    | Value           |
| ----------------------- | ------------------------------ | --------------- |
| `priorityClass.enabled` | Flag to enable Priority Class. | `true`          |
| `priorityClass.name`    | Name of the Priority Class.    | `high-priority` |

### Prometheus Configurations

| Name                 | Description                | Value  |
| -------------------- | -------------------------- | ------ |
| `prometheus.enabled` | Flag to enable Prometheus. | `true` |

### Loki Configurations

| Name           | Description          | Value  |
| -------------- | -------------------- | ------ |
| `loki.enabled` | Flag to enable Loki. | `true` |

### Grafana Configurations

| Name                      | Description                   | Value       |
| ------------------------- | ----------------------------- | ----------- |
| `grafana.enabled`         | Flag to enable Grafana.       | `true`      |
| `grafana.persistenceSize` | Persistence size for Grafana. | `10Gi`      |
| `grafana.adminPassword`   | Admin password for Grafana.   | `admin@123` |
| `grafana.adminUser`       | Admin username for Grafana.   | `admin`     |

### cansoAgent configuration

| Name                      | Description                                 | Value  |
| ------------------------- | ------------------------------------------- | ------ |
| `cansoAgent.replicaCount` | count of replicas                           | `3`    |
| `cansoAgent.enabled`      | Boolean Flag to deploy Canso Agent          | `true` |
| `cansoAgent.tolerations`  | Taints that pod can tolerate                | `[]`   |
| `cansoAgent.affinity`     | Affinity rules for pod scheduling on a node | `{}`   |
| `cansoAgent.roleArn`      | roleArn name of the irsa role for the agent | `""`   |

### Roles

| Name                     | Description                                                                   | Value                                   |
| ------------------------ | ----------------------------------------------------------------------------- | --------------------------------------- |
| `roles.s3role`           | S3 Role for Canso Agent                                                       | `""`                                    |
| `ingress.enabled`        | Boolean Flag to deploy Canso Agent                                            | `true`                                  |
| `ingress.nodeSelector`   | The node selector for pod assignment for the Ingress Controller pods          | `{}`                                    |
| `ingress.tolerations`    | The tolerations of the Ingress Controller pods                                | `[]`                                    |
| `ingress.affinity`       | The affinity of the Ingress Controller pods                                   | `{}`                                    |
| `ingress.env`            | The additional environment variables to be set on the Ingress Controller pods | `[]`                                    |
| `ingress.auth_pass`      | The basic auth password for the Network Load balancer                         | `$apr1$IYG9bEux$xw8CgNhoha.oE/xzZcdXR/` |
| `ingress.master.enabled` | Flag for creating ingress controller master                                   | `true`                                  |
