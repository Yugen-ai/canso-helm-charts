## Parameters

### karpenter.serviceAccount Service account configuration

| Name                                   | Description                                           | Value       |
| -------------------------------------- | ----------------------------------------------------- | ----------- |
| `karpenter.serviceAccount.create`      | Specifies whether a ServiceAccount should be created. | `true`      |
| `karpenter.serviceAccount.name`        | The name of the ServiceAccount to use.                | `karpenter` |
| `karpenter.serviceAccount.annotations` | Additional annotations for the ServiceAccount.        | `{}`        |
| `karpenter.additionalClusterRoleRules` | Additional rules to add into the ClusterRole.         | `[]`        |

### karpenter.serviceMonitor Service monitor configuration

| Name                                        | Description                                                | Value   |
| ------------------------------------------- | ---------------------------------------------------------- | ------- |
| `karpenter.serviceMonitor.enabled`          | Specifies whether a ServiceMonitor should be created.      | `false` |
| `karpenter.serviceMonitor.additionalLabels` | Additional labels for the ServiceMonitor.                  | `{}`    |
| `karpenter.serviceMonitor.endpointConfig`   | Endpoint configuration for the ServiceMonitor.             | `{}`    |
| `karpenter.replicas`                        | Number of replicas for the Karpenter controller.           | `2`     |
| `karpenter.revisionHistoryLimit`            | The number of old ReplicaSets to retain to allow rollback. | `10`    |

### karpenter.strategy Rolling update configuration parameters.

| Name                          | Description                                                          | Value                     |
| ----------------------------- | -------------------------------------------------------------------- | ------------------------- |
| `karpenter.podLabels`         | Additional labels for the Karpenter pod.                             | `{}`                      |
| `karpenter.podAnnotations`    | Additional annotations for the Karpenter pod.                        | `{}`                      |
| `karpenter.priorityClassName` | PriorityClass name for the pod.                                      | `system-cluster-critical` |
| `karpenter.hostNetwork`       | Bind the pod to the host network (required when using a custom CNI). | `false`                   |
| `karpenter.dnsPolicy`         | Configure the DNS Policy for the pod.                                | `ClusterFirst`            |
| `karpenter.dnsConfig`         | Configure DNS Config for the pod.                                    | `{}`                      |

### karpenter.affinity Affinity rules for scheduling the pod.

| Name                     | Description                     | Value |
| ------------------------ | ------------------------------- | ----- |
| `karpenter.extraVolumes` | Additional volumes for the pod. | `[]`  |

### karpenter.controller Karpenter controller configuration

| Name                                       | Description                                                        | Value                                                                     |
| ------------------------------------------ | ------------------------------------------------------------------ | ------------------------------------------------------------------------- |
| `karpenter.controller.image.repository`    | Repository path to the controller image.                           | `public.ecr.aws/karpenter/controller`                                     |
| `karpenter.controller.image.tag`           | Tag of the controller image.                                       | `1.0.7`                                                                   |
| `karpenter.controller.image.digest`        | SHA256 digest of the controller image.                             | `sha256:1c64c64ec89b7d33c93558d24f3c7a26b6176869ac11182b870fe9edb5c033ce` |
| `karpenter.controller.env`                 | Additional environment variables for the controller pod.           | `[]`                                                                      |
| `karpenter.controller.envFrom`             | Additional environment variables from config map or secret.        | `[]`                                                                      |
| `karpenter.controller.resources`           | Resources for the controller pod.                                  | `{}`                                                                      |
| `karpenter.controller.extraVolumeMounts`   | Additional volumeMounts for the controller pod.                    | `[]`                                                                      |
| `karpenter.controller.sidecarContainer`    | Additional sidecar container configuration for the controller pod. | `[]`                                                                      |
| `karpenter.controller.sidecarVolumeMounts` | Additional volume mounts for the sidecar container.                | `[]`                                                                      |
| `karpenter.controller.metrics.port`        | The container port to use for metrics.                             | `8080`                                                                    |
| `karpenter.controller.healthProbe.port`    | The container port to use for the http health probe.               | `8081`                                                                    |

### karpenter.webhook Webhook configuration

| Name                             | Description                                             | Value        |
| -------------------------------- | ------------------------------------------------------- | ------------ |
| `karpenter.webhook.enabled`      | Whether to enable the webhooks and webhook permissions. | `false`      |
| `karpenter.webhook.port`         | The container port to use for the webhook.              | `8443`       |
| `karpenter.webhook.metrics.port` | The container port to use for webhook metrics.          | `8001`       |
| `karpenter.logLevel`             | Global log level, defaults to 'info'                    | `info`       |
| `karpenter.logOutputPaths`       | Log outputPaths defaults to stdout only                 | `["stdout"]` |
| `karpenter.logErrorOutputPaths`  | Log errorOutputPaths defaults to stderr only            | `["stderr"]` |

### karpenter.settings Global settings to configure Karpenter

| Name                                         | Description                                                                                                                                                                                                                | Value   |
| -------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `karpenter.settings.batchMaxDuration`        | The maximum length of a batch window.                                                                                                                                                                                      | `10s`   |
| `karpenter.settings.batchIdleDuration`       | The maximum amount of time with no new ending pods that if exceeded ends the current batching window.                                                                                                                      | `1s`    |
| `karpenter.settings.clusterCABundle`         | Cluster CA bundle for TLS configuration of provisioned nodes. If not set, this is taken from the controller's TLS configuration for the API server.                                                                        | `""`    |
| `karpenter.settings.clusterName`             | Cluster name.                                                                                                                                                                                                              | `""`    |
| `karpenter.settings.clusterEndpoint`         | Cluster endpoint. If not set, will be discovered during startup (EKS only).                                                                                                                                                | `""`    |
| `karpenter.settings.isolatedVPC`             | If true, assume AWS services without a VPC endpoint cannot be reached. This also disables look-ups to the AWS pricing endpoint.                                                                                            | `false` |
| `karpenter.settings.vmMemoryOverheadPercent` | The VM memory overhead as a percent, subtracted from total memory for all instance types.                                                                                                                                  | `0.075` |
| `karpenter.settings.interruptionQueue`       | Name of the SQS queue to use for interruption handling. If not specified, interruption handling is disabled. Enabling requires additional permissions on the controller service account, as outlined in the documentation. | `""`    |
| `karpenter.settings.reservedENIs`            | Number of reserved ENIs not included in max-pods or kube-reserved calculations. Often used in VPC CNI custom networking.                                                                                                   | `0`     |

### karpenter.settings.featureGates Feature gate configuration values. Feature gates follow the same graduation process and requirements as in Kubernetes.

| Name                                                      | Description                                                                                                   | Value   |
| --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------- |
| `karpenter.settings.featureGates.spotToSpotConsolidation` | Setting this to true will enable spot replacement consolidation for both single and multi-node consolidation. | `false` |
