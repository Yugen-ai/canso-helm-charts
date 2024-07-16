## Parameters

### Pod Admin Role Configurations

| Name                     | Description                                  | Value            |
| ------------------------ | -------------------------------------------- | ---------------- |
| `pod_admin_role.enabled` | Boolean Flag to enable Pod Admin role        | `true`           |
| `pod_admin_role.name`    | Name of the pod admin role for Airflow jobs. | `pod-admin-role` |

### Pod Role Configurations

| Name              | Description                            | Value      |
| ----------------- | -------------------------------------- | ---------- |
| `podRole.enabled` | Boolean Flag to enable Pod role        | `true`     |
| `podRole.name`    | Name of the pod role for Airflow jobs. | `pod-role` |

### Service Account Configurations

| Name                      | Description                                   | Value             |
| ------------------------- | --------------------------------------------- | ----------------- |
| `serviceAccount.enabled`  | Boolean Flag to create Service account        | `true`            |
| `serviceAccount.name`     | Name of the service account for Airflow jobs. | `airflow-jobs-sa` |
| `serviceAccount.role_arn` | Service Account Role ARN                      | `""`              |

### Spark Role Binding Configurations

| Name                                   | Description                                                                  | Value                       |
| -------------------------------------- | ---------------------------------------------------------------------------- | --------------------------- |
| `sparkRolebinding.enabled`             | Flag to enable Spark Role Binding. Strongly advised to not change the value. | `true`                      |
| `sparkRolebinding.name`                | Name of the Spark role binding.                                              | `spark-airflow-rolebinding` |
| `sparkRolebinding.serviceAccount_name` | Name of the <TODO - to be updated>.                                          | `default`                   |

### Pod Role Binding Configurations

| Name                                 | Description                                                                | Value              |
| ------------------------------------ | -------------------------------------------------------------------------- | ------------------ |
| `podRoleBinding.enabled`             | Flag to enable POD Role Binding. Strongly advised to not change the value. | `true`             |
| `podRoleBinding.name`                | Name of the pod role binding.                                              | `pod-role-binding` |
| `podRoleBinding.serviceAccount_name` | Name of the service account for pod role binding.                          | `airflow-sa`       |

### External Secrets Configurations

| Name                                | Description                          | Value                            |
| ----------------------------------- | ------------------------------------ | -------------------------------- |
| `external_secret.enabled`           | Flag to enable External Secrets      | `true`                           |
| `external_secret.name`              | name of the external secret          | `canso-image-pull-secrets`       |
| `external_secret.secretKey`         | key of the kubernetes secret         | `.dockerconfigjson`              |
| `external_secret.remoteRefKey`      | name of the AWS secret               | `canso/dockerhub`                |
| `external_secret.remoteRefProperty` | key of the secret in secrets manager | `dockerhub`                      |
| `external_secret.targetName`        | name of the target kubernetes secret | `docker-secret-cred`             |
| `external_secret.targetType`        | type of the target kubernetes secret | `kubernetes.io/dockerconfigjson` |
| `external_secret.clusterSecretRole` | name of the ClusterSecret Role       | `secretstore-by-role`            |
