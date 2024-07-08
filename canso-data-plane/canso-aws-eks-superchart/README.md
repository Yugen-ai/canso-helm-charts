## Parameters

### ArgoCD Configs

| Name            | Description                | Value           |
| --------------- | -------------------------- | --------------- |
| `argocdProject` | ArgoCD project name.       | `canso-appsets` |
| `createProject` | Create the ArgoCD project. | `true`          |

### Default Configs

| Name              | Description                          | Value |
| ----------------- | ------------------------------------ | ----- |
| `clusterName`     | Name of the AWS EKS cluster.         | `""`  |
| `clusterEndpoint` | Endpoint URL of the AWS EKS cluster. | `""`  |
| `tenantName`      | Name Assigned to the Tenant          | `""`  |
| `tenantID`        | Unique ID assigned to the Tenant     | `""`  |
| `awsRegion`       | AWS Region of the cluster            | `""`  |

### Control Plane Configs

| Name                                     | Description                                                                | Value |
| ---------------------------------------- | -------------------------------------------------------------------------- | ----- |
| `cansoControlPlane.deployment_sqs_url`   | deployment sqs url in Control Plane. Generated during Tenant onboarding.   | `""`  |
| `cansoControlPlane.notification_sqs_url` | notification sqs url in Control Plane. Generated during Tenant onboarding. | `""`  |
| `cansoControlPlane.sqs_region`           | region for sqs url in Control Plane. Generated during Tenant onboarding.   | `""`  |
| `tolerations`                            | Tolerations for the deployment.                                            | `{}`  |
| `affinity`                               | Affinity for the deployment.                                               | `{}`  |

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

### Spark Operator Configurations

| Name                             | Description                              | Value  |
| -------------------------------- | ---------------------------------------- | ------ |
| `sparkOperator.enabled`          | Flag to enable Spark Operator.           | `true` |
| `sparkOperator.ingressUrlFormat` | Ingress URL format.                      | `""`   |
| `sparkOperator.nodeSelector`     | Node labels for pod assignment           | `{}`   |
| `sparkOperator.tolerations`      | List of node taints to tolerate          | `[]`   |
| `sparkOperator.affinity`         | Affinity for pod assignment              | `{}`   |
| `sparkOperator.podAnnotations`   | Additional annotations to add to the pod | `{}`   |
| `sparkOperator.podLabels`        | Additional labels to add to the pod      | `{}`   |
| `sparkOperator.resources`        | Pod resource requests and limits         | `{}`   |

### Airflow

| Name                          | Description                                                                       | Value                                        |
| ----------------------------- | --------------------------------------------------------------------------------- | -------------------------------------------- |
| `airflow.enabled`             | Flag to enable Airflow.                                                           | `true`                                       |
| `airflow.namespace`           | Namespace where Airflow will be deployed.                                         | `airflow`                                    |
| `airflow.roleArn`             | Rolearn of the irsa role created for the airflow installation                     | `arn:aws:iam::ACCOUNT_ID:role/IAM_ROLE_NAME` |
| `airflow.serviceAccountName`  | Name of the service account to be created by the airflow chart with above roleArn | `airflow-sa`                                 |
| `airflow.remoteLogBaseFolder` | S3 bucket path where logs will be stored                                          | `s3://canso-logging/airflow/logs`            |
| `airflow.pvc.enabled`         | Flag to enable the creation of a PVC                                              | `true`                                       |
| `airflow.pvc.name`            | Name of the PersistentVolumeClaim (PVC)                                           | `airflow-pvc`                                |
| `airflow.pvc.storage`         | Size of the storage for the PVC                                                   | `1Gi`                                        |
| `airflow.user.enabled`        | Flag to enable the creation of a user for Airflow                                 | `true`                                       |
| `airflow.user.username`       | Username for Airflow.                                                             | `admin`                                      |
| `airflow.user.password`       | Password for Airflow.                                                             | `admin#airflow@123`                          |

### Jerry

| Name                            | Description                                                            | Value      |
| ------------------------------- | ---------------------------------------------------------------------- | ---------- |
| `jerry.enabled`                 | Flag to enable Jerry.                                                  | `true`     |
| `jerry.external_secret.enabled` | Flag to enable the creation of a secret in the same namespace as jerry | `true`     |
| `jerry.image.tag`               | Tag of the Jerry image.                                                | `v1.0.4`   |
| `jerry.service.type`            | Type of the service for Jerry.                                         | `NodePort` |
| `jerry.service.port`            | Port of the service for Jerry.                                         | `3000`     |
| `jerry.readinessProbe.enabled`  | Flag to enable readiness probe for Jerry.                              | `false`    |
| `jerry.livenessProbe.enabled`   | Flag to enable liveness probe for Jerry.                               | `false`    |

### Online Feature Service

| Name                               | Description                                             | Value    |
| ---------------------------------- | ------------------------------------------------------- | -------- |
| `onlineFS.enabled`                 | Flag to enable Online Feature Store.                    | `true`   |
| `onlineFS.external_secret.enabled` | Flag to enable the creation of an external secret       | `true`   |
| `onlineFS.deployment.replicaCount` | Number of replicas for Online Feature Store deployment. | `1`      |
| `onlineFS.deployment.image.tag`    | Tag of the Online Feature Store image.                  | `v0.0.1` |
| `onlineFS.ingress.enabled`         | Flag to enable ingress for Online Feature Store.        | `false`  |

### Airflow Jobs

| Name                         | Description                  | Value                |
| ---------------------------- | ---------------------------- | -------------------- |
| `cansoAirflowJobs.enabled`   | Flag to enable airflow jobs. | `true`               |
| `cansoAirflowJobs.namespace` | Namespace for airflow jobs.  | `canso-airflow-jobs` |

### cansoAgent configuration

| Name                     | Description                                 | Value  |
| ------------------------ | ------------------------------------------- | ------ |
| `cansoAgent.enabled`     | Boolean Flag to deploy Canso Agent          | `true` |
| `cansoAgent.tolerations` | Taints that pod can tolerate                | `[]`   |
| `cansoAgent.affinity`    | Affinity rules for pod scheduling on a node | `{}`   |

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
