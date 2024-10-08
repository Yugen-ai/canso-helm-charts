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
| `karpenter.dnsPolicy`         | Configure the DNS Policy for the pod.                                | `Default`                 |
| `karpenter.dnsConfig`         | Configure DNS Config for the pod.                                    | `{}`                      |

### karpenter.affinity Affinity rules for scheduling the pod.

| Name                     | Description                     | Value |
| ------------------------ | ------------------------------- | ----- |
| `karpenter.extraVolumes` | Additional volumes for the pod. | `[]`  |

### karpenter.controller Karpenter controller configuration

| Name                                       | Description                                                        | Value                                                                     |
| ------------------------------------------ | ------------------------------------------------------------------ | ------------------------------------------------------------------------- |
| `karpenter.controller.image.repository`    | Repository path to the controller image.                           | `public.ecr.aws/karpenter/controller`                                     |
| `karpenter.controller.image.tag`           | Tag of the controller image.                                       | `v0.33.1`                                                                 |
| `karpenter.controller.image.digest`        | SHA256 digest of the controller image.                             | `sha256:7f484951baf70d1574d6408be3947a3ca5f54463c2d1f29993b492e7e916ef11` |
| `karpenter.controller.env`                 | Additional environment variables for the controller pod.           | `[]`                                                                      |
| `karpenter.controller.envFrom`             | Additional environment variables from config map or secret.        | `[]`                                                                      |
| `karpenter.controller.resources`           | Resources for the controller pod.                                  | `{}`                                                                      |
| `karpenter.controller.extraVolumeMounts`   | Additional volumeMounts for the controller pod.                    | `[]`                                                                      |
| `karpenter.controller.sidecarContainer`    | Additional sidecar container configuration for the controller pod. | `[]`                                                                      |
| `karpenter.controller.sidecarVolumeMounts` | Additional volume mounts for the sidecar container.                | `[]`                                                                      |
| `karpenter.controller.metrics.port`        | The container port to use for metrics.                             | `8000`                                                                    |
| `karpenter.controller.healthProbe.port`    | The container port to use for the http health probe.               | `8081`                                                                    |

### karpenter.webhook Webhook configuration

| Name                             | Description                                             | Value   |
| -------------------------------- | ------------------------------------------------------- | ------- |
| `karpenter.webhook.enabled`      | Whether to enable the webhooks and webhook permissions. | `false` |
| `karpenter.webhook.port`         | The container port to use for the webhook.              | `8443`  |
| `karpenter.webhook.metrics.port` | The container port to use for webhook metrics.          | `8001`  |
| `karpenter.logLevel`             | Global log level, defaults to 'info'                    | `info`  |

### karpenter.logConfig Log configuration (Deprecated: Logging configuration will be dropped by v1, use logLevel instead)

| Name                                      | Description                                                        | Value        |
| ----------------------------------------- | ------------------------------------------------------------------ | ------------ |
| `karpenter.logConfig.enabled`             | Whether to enable provisioning and mounting the log ConfigMap.     | `false`      |
| `karpenter.logConfig.outputPaths`         | Log output paths - defaults to stdout only.                        | `["stdout"]` |
| `karpenter.logConfig.errorOutputPaths`    | Log error output paths - defaults to stderr only.                  | `["stderr"]` |
| `karpenter.logConfig.logEncoding`         | Log encoding - defaults to json - must be one of 'json', 'console' | `json`       |
| `karpenter.logConfig.logLevel.global`     | Global log level, defaults to 'info'.                              | `info`       |
| `karpenter.logConfig.logLevel.controller` | Controller log level, defaults to 'info'.                          | `info`       |
| `karpenter.logConfig.logLevel.webhook`    | Webhook log level, defaults to 'error'.                            | `error`      |

### karpenter.settings Global settings to configure Karpenter

| Name                                         | Description                                                                                                                                                                                                                | Value   |
| -------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `karpenter.settings.batchMaxDuration`        | The maximum length of a batch window.                                                                                                                                                                                      | `10s`   |
| `karpenter.settings.batchIdleDuration`       | The maximum amount of time with no new ending pods that if exceeded ends the current batching window.                                                                                                                      | `1s`    |
| `karpenter.settings.assumeRoleARN`           | Role to assume for calling AWS services.                                                                                                                                                                                   | `""`    |
| `karpenter.settings.assumeRoleDuration`      | Duration of assumed credentials in minutes. Default value is 15 minutes. Not used unless assumeRoleARN set.                                                                                                                | `15m`   |
| `karpenter.settings.clusterCABundle`         | Cluster CA bundle for TLS configuration of provisioned nodes. If not set, this is taken from the controller's TLS configuration for the API server.                                                                        | `""`    |
| `karpenter.settings.clusterName`             | Cluster name.                                                                                                                                                                                                              | `""`    |
| `karpenter.settings.clusterEndpoint`         | Cluster endpoint. If not set, will be discovered during startup (EKS only).                                                                                                                                                | `""`    |
| `karpenter.settings.isolatedVPC`             | If true, assume AWS services without a VPC endpoint cannot be reached. This also disables look-ups to the AWS pricing endpoint.                                                                                            | `false` |
| `karpenter.settings.vmMemoryOverheadPercent` | The VM memory overhead as a percent, subtracted from total memory for all instance types.                                                                                                                                  | `0.075` |
| `karpenter.settings.interruptionQueue`       | Name of the SQS queue to use for interruption handling. If not specified, interruption handling is disabled. Enabling requires additional permissions on the controller service account, as outlined in the documentation. | `""`    |
| `karpenter.settings.reservedENIs`            | Number of reserved ENIs not included in max-pods or kube-reserved calculations. Often used in VPC CNI custom networking.                                                                                                   | `0`     |

### karpenter.settings.featureGates Feature gate configuration values. Feature gates follow the same graduation process and requirements as in Kubernetes.

| Name                                    | Description                                                                                                                                                                           | Value  |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ |
| `karpenter.settings.featureGates.drift` | Enable/disable the drift disruption method to watch for drift between deployed nodes and the desired state set in nodepools and nodeclasses. Drift is in BETA and enabled by default. | `true` |
